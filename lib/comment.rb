require 'csv'

class Comment
  attr_accessor :author_com, :content_com

  def initialize(author_com, content_com)
    @author_com = author_com
    @content_com = content_com
  end

  def save_com
    CSV.open("./db/comment.csv", "ab") do |csv|
      csv << [@author_com, @content_com]
    end
  end

  def self.all_com
    all_comments = []
    CSV.read("./db/comment.csv").each do |csv_line|
      all_comments << Comment.new(csv_line[0], csv_line[1])
    end
    return all_comments
  end

  def self.find(id)
    id = id.to_i
    all_comments = Comment.all
    all_comments[id]
  end

end