class Job < ActiveRecord::Base
  belongs_to :employer
  belongs_to :category

  has_many :applications, :class_name => "::JobApplication", :dependent => :destroy

  acts_as_taggable
  validates_presence_of :title, :employer_id, :category_id, :deadline

  def self.filter params
    query = Job.where("deadline >= ?", Time.zone.now)
    query = apply_employer_filter(params[:employer].downcase, query) if params[:employer] && params[:employer] != ""
    query = apply_title_filter(params[:title].downcase, query) if params[:title] && params[:title] != ""
    query = apply_content_filter(params[:content].downcase, query) if params[:content] && params[:content] != ""
    query = apply_tags_filter(params[:tag].downcase, query) if params[:tag] && params[:tag] != ""
    return query
  end

  def self.apply_employer_filter employer, query
    query.joins(:employer).where("LOWER(employers.company_name) LIKE ?","%#{employer}%")
  end

  def self.apply_title_filter title, query
    query.where("LOWER(jobs.title) LIKE ?","%#{title}%")
  end

  def self.apply_content_filter content, query
    query.where("LOWER(jobs.description) LIKE ?","%#{content}%")
  end

  def self.apply_tags_filter tag, query
    query.tagged_with(tag)
  end

end
