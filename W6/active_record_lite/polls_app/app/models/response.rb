class Response < ApplicationRecord
  validate :not_duplicate_response, unless: -> { answer_choice.nil? }
  validate :author_cant_respond_to_own_poll, unless: -> { answer_choice.nil? }

  belongs_to :respodent,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :answer_choice,
  foreign_key: :answer_choice_id,
  class_name: :AnswerChoice

  has_one :question,
  through: :answer_choice,
  source: :question

  has_many :responses,
  through: :respodent,
  source: :responses


  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respodent_already_answered?
      sibling_responses.exists?(respodent_id: self.user_id)
  end

  def not_duplicate_response
    if respodent_already_answered?
      errors[:user_id] << "cannot vote twice for same question"
    end
  end

  def author_cant_respond_to_own_poll
    poll_author_id = self.question.poll.author_id
    if poll_author_id == self.user_id
      errors[:user_id] << "cannot vote on own poll"
    end
  end

end