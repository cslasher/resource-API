var mongoose = require('mongoose')

var UserProfile = mongoose.model('UserPrifile', {
  email: {
      type: String,
      required: true,
      trim: true,
      minlength: 1,
      unique: true,
      validate: {
          validator: (value) => { return validator.isEmail(value)},
          message: '{value} is not a valid email'
      }
  },
  nickname: {
    type: String,
    trim: true
  },
  image: {
    type: String,
    trim: true
  },
  cover: {
    type: String,
    trim: true
  },
  bio: {
    type: String,
    trim: true
  },
  update_time: {
    type: Date,
    trim: true
  },
  _user: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  }
})

module.exports = {UserProfile}
