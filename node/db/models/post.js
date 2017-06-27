var mongoose = require('mongoose')

var Post = mongoose.model('Post', {
  title: {
    type: String,
    trim: true
  },
  subtitle: {
    type: String,
    trim: true
  },
  content: {
    type: String,
    trim: true
  },
  image: {
    type: String,
    trim: true
  },
  image_expand: {
    type: Number,
    trim: true
  },
  recommends: {
    type: Number,
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

module.exports = {Post}
