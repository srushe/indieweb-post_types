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
      items/rsvp-aaron.json
      items/rsvp-aaronmultiple.json
      items/rsvp-tantek.json
    ]
  end

  def reply_examples
    %w[
      items/reply-aaron.json
      items/reply-aaronmultiple.json
    ]
  end

  def repost_examples
    %w[
      items/repost-aaron.json
    ]
  end

  def like_examples
    %w[
      items/like-aaron.json
    ]
  end

  def video_examples
    %w[
      items/video-aaron.json
      items/video-shane.json
    ]
  end

  def photo_examples
    %w[
      items/photo-aaron.json
      items/photo-tantek.json
    ]
  end

  def article_examples
    %w[
      items/article-aaron.json
      items/article-tantek.json
    ]
  end

  def note_examples
    %w[
      items/note-aaron.json
      items/note-aaron2.json
    ]
  end
end
