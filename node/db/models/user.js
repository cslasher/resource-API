const mongoose = require('mongoose')
const validator = require('validator')
const jwt = require('jsonwebtoken')
const _ = require('lodash')
const bcrypt = require('bcryptjs')

var UserSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
    trim: true,
    minlength: 1,
    unique: true
  },
  password: {
    type: String,
    required: true,
    minlength: 6
  },
  facebook_account: {
    type: String,
    trim: true,
    default: null
  },
  facebook_id: {
    type: Number,
    default: null
  },
  active: {
    type: Boolean,
    default: true
  },
  read_only: {
    type: Boolean,
    default: false
  }
  tokens: [{
    access: {
      type: String,
      required: true
    },
    token: {
      type: String,
      required: true
    }
  }]
})

UserSchema.methods.toJSON = function() {
    var user = this
    var userObject = user.toObject()

    return _.pick(userObject, ['_id', 'username', 'active', 'read_only'])
}

UserSchema.methods.generateAuthToken = function() {
    var user = this
    var access = 'auth'
    var token = jwt.sign({
        _id: user._id.toHexString(), access
    }, process.env.AuthSecret).toString()
    user.tokens.push({access, token})

    return user.save().then(() => {
        return token
    })
}

UserSchema.methods.removeToken = function(token) {
  var user = this

  return user.update({
    $pull: {
      tokens: {token}
    }
  })
}

UserSchema.statics.findByToken = function(token) {
    var User = this
    var decoded

    try {
        decoded = jwt.verify(token, process.env.AuthSecret)
    } catch(e) {
        return Promise.reject()
    }

    return User.findOne({
        '_id': decoded._id,
        'tokens.token': token,
        'tokens.access': 'auth'
    })
}

UserSchema.statics.findByCredentials = function(username, password) {
  var User = this

  return User.findOne({username}).then((user) => {
    if (!user) {
      return Promise.reject()
    }

    return new Promise((resolve, reject) => {
      bcrypt.compare(password, user.password, (err, res) => {
        if (res) {
          return resolve(user)
        } else {
          return reject()
        }
      })
    })
  })
}

UserSchema.pre('save', function(next) {
    var user = this

    if (user.isModified('password')) {

    bcrypt.genSalt(10, (err, salt) => {
      if (err) {
        return console.log(err)
      }
      bcrypt.hash(user.password, salt, (err, hash) => {
        if (err) {
          return console.log(err)
        }
        user.password = hash
        next()
      })
    })
  } else {
    next()
  }
})

var User = mongoose.model('User', UserSchema)
module.exports = {User}
