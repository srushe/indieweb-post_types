module ExampleData
  def examples_for(*types)
    grouped_examples.values_at(*types).flatten.sort
  end

  private

  def grouped_examples
    {
      rsvp: rsvp_examples,
      reply: reply_examples,
      repost: repost_examples,
      like: like_examples,
      video: video_examples,
      photo: photo_examples,
      article: article_examples,
      note: note_examples
    }
  end

  def rsvp_examples
    %w[
      entry/rsvp-aaron.json
      entry/rsvp-aaronmultiple.json
      entry/rsvp-tantek.json
      items/rsvp-aaron.json
      items/rsvp-aaronmultiple.json
      items/rsvp-tantek.json
      jf2/rsvp.json
    ]
  end

  def reply_examples
    %w[
      entry/reply-aaron.json
      entry/reply-aaronmultiple.json
      items/reply-aaron.json
      items/reply-aaronmultiple.json
      jf2/basic-reply.json
    ]
  end

  def repost_examples
    %w[
      entry/repost-aaron.json
      items/repost-aaron.json
      jf2/repost.json
    ]
  end

  def like_examples
    %w[
      entry/like-aaron.json
      entry/like-barryf.json
      items/like-aaron.json
      jf2/like.json
    ]
  end

  def video_examples
    %w[
      entry/video-aaron.json
      entry/video-shane.json
      items/video-aaron.json
      items/video-shane.json
      jf2/video.json
    ]
  end

  def photo_examples
    %w[
      entry/photo-aaron.json
      entry/photo-micropub-rocks.json
      entry/photo-tantek.json
      items/photo-aaron.json
      items/photo-tantek.json
      jf2/basic-photo.json
    ]
  end

  def article_examples
    %w[
      entry/article-aaron.json
      entry/article-barryf.json
      entry/article-tantek.json
      items/article-aaron.json
      items/article-tantek.json
    ]
  end

  def note_examples
    %w[
      entry/note-aaron.json
      entry/note-aaron2.json
      entry/note-micropub-rocks.json
      items/note-aaron.json
      items/note-aaron2.json
      jf2/basic-photo-invalid-url.json
      jf2/html-content.json
      jf2/plain-text.json
    ]
  end
end
