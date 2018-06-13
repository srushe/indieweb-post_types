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
      rsvp-aaron.json
      rsvp-aaronmultiple.json
      rsvp-tantek.json
    ]
  end

  def reply_examples
    %w[
      reply-aaron.json
      reply-aaronmultiple.json
    ]
  end

  def repost_examples
    %w[
      repost-aaron.json
    ]
  end

  def like_examples
    %w[
      like-aaron.json
    ]
  end

  def video_examples
    %w[
      video-aaron.json
      video-shane.json
    ]
  end

  def photo_examples
    %w[
      photo-aaron.json
      photo-tantek.json
    ]
  end

  def article_examples
    %w[
      article-aaron.json
      article-tantek.json
    ]
  end

  def note_examples
    %w[
      note-aaron.json
      note-aaron2.json
    ]
  end
end
