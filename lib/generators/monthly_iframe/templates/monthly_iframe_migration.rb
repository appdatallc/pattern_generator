class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    sql = "CREATE TABLE `<%= migration_table_name %>` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_created_at` date DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `long_url_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_no_www` varchar(255) DEFAULT NULL,
  `url_no_www_sha1` varchar(255) DEFAULT NULL,
  `is_external` tinyint(1) DEFAULT '0',
  `is_fetched` tinyint(1) DEFAULT '0',
  `is_resolved` tinyint(1) DEFAULT '0',
  `data_source` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id__is_fetched` (`site_id`,`is_fetched`),
  KEY `site_id__page_id` (`site_id`,`page_id`),
  KEY `site_id__url_no_www_sha1` (`site_id`,`url_no_www_sha1`),
  KEY `data_source__site_id` (`data_source`,`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;"
   ActiveRecord::Base.connection.execute(sql)
  end
end
