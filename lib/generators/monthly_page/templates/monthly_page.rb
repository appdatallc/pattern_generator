class <%= class_name %> < ActiveRecord::Base


  #########################################################################
  #
  # class level directives
  #
  #########################################################################
  paginates_per 20

  require 'common_page'
  include CommonPage

  #########################################################################
  #
  # attr_accessible
  #
  #########################################################################
  attr_accessible :title

  attr_accessor :crawl_id

  #########################################################################
  #
  # validations
  #
  #########################################################################
  validates_presence_of :date_created_at, :message => "date_created_at cannot be blank for site: #{self.inspect}"
  validates_presence_of :site_id, :message => "site_id cannot be blank for site: #{self.inspect}"
  validates_presence_of :url_no_www_sha1, :message => "url_no_www_sha1 cannot be blank for site: #{self.inspect}"
  validates_presence_of :data_source, :message => "data_source cannot be blank for site: #{self.inspect}"

  #########################################################################
  #
  # belongs_to
  #
  #########################################################################
  belongs_to :site
  belongs_to :link

  #########################################################################
  #
  # has_many
  #
  #########################################################################
  has_one :long_url
  #has_one :page_body, :class_name => PageBody2016Q2
  has_many :links
  has_many :headings
  has_many :emphasized_words
  has_many :email_addresses
  has_many :forms

  #########################################################################
  #
  # call backs
  #
  #########################################################################


  #########################################################################
  #
  # scopes
  #
  #########################################################################


  #########################################################################
  #
  # CLASS METHODS
  #
  #########################################################################

  # def self.year
  #   2016
  # end
  #
  # def self.month
  #   3
  # end
  #
  # def self.day_start
  #   1
  # end
  #
  # def self.day_end
  #   31
  # end


  #########################################################################
  #
  # INSTANCE METHODS
  #
  #########################################################################

  # def page_body
  #   PageBody2016Q2
  # end
end
