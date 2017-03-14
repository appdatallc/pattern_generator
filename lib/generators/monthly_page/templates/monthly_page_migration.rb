class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    #
    #   t.timestamps null: false
    # end
    sql = "CREATE TABLE `<%= migration_table_name %>` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_created_at` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_no_www` varchar(255) DEFAULT NULL,
  `url_no_www_sha1` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `page_body_id` int(11) DEFAULT NULL,
  `long_url_id` int(11) DEFAULT NULL,
  `html_size` int(11) DEFAULT NULL,
  `ascii_size` int(11) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `data_source` int(11) DEFAULT NULL,
  `is_external` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pages_on_site_id_and_crawl_id_and_url_no_www_sha1` (`site_id`,`url_no_www_sha1`) USING BTREE,
  KEY `index_pages_on_site_id_and_crawl_id_and_title` (`site_id`,`title`) USING BTREE,
  KEY `link_id` (`link_id`),
  KEY `instance_id` (`instance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;"
    
    ActiveRecord::Base.connection.execute(sql)
  end
end
