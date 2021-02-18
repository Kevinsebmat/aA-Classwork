require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0
    
    Question.new(question.first)
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0
    
    Question.new(question.first)
  end

  def initialize(column)
    @id, @title, @body, @author_id = column.values
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def initialize(user_hash)
    @id, @fname, @lname = user_hash.values
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end
end

class QuestionFollow
  attr_accessor :id, :users_id, :questions_id
  
  def self.find_by_id(users_id, questions_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, users_id, questions_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        users_id = ? OR questions_id = ?
    SQL
    return nil unless follow.length > 0

    QuestionFollow.new(follow.first)
  end

  def initialize(question_follow_hash)
    @id, @users_id, @questions_id = question_follow_hash.values
  end
end

class Reply
  attr_accessor :id, :subject_question_id, :parent_reply_id, :users_id, :body

  def self.find_by_user_id(users_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, users_id)
      SELECT
        *
      FROM
        replies
      WHERE
        users_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_question_id(subject_question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, subject_question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        subject_question_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_parent_reply_id(parent_reply_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def initialize(reply_hash)
    @id, @subject_question_id, @parent_reply_id, @users_id, @body = reply_hash.values
  end

  def author
    User.find_by_id(users_id)
  end

  def question
    Question.find_by_id(subject_question_id)
  end

  def parent_reply
    Reply.find_by_parent_reply_id(parent_reply_id)
  end

  def child_replies
    Reply.find_by_parent_reply_id(id)
  end
end

