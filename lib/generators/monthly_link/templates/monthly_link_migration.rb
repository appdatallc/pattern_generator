class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    sql = "CREATE TABLE `<%= migration_table_name %>` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_created_at` date DEFAULT NULL,
  `last_checked_at` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_no_www` varchar(255) DEFAULT NULL,
  `url_no_www_sha1` varchar(255) DEFAULT NULL,
  `is_resolved` tinyint(1) DEFAULT NULL,
  `is_external` tinyint(1) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `long_url_id` int(11) DEFAULT NULL,
  `redirect_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `http_status` int(11) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `link_count` int(11) DEFAULT '1',
  `mime_type` varchar(255) DEFAULT NULL,
  `base_domain_id` int(11) DEFAULT NULL,
  `second_domain_id` int(11) DEFAULT NULL,
  `third_domain_id` int(11) DEFAULT NULL,
  `base_dir_id` int(11) DEFAULT NULL,
  `second_dir_id` int(11) DEFAULT NULL,
  `crawling_run_id` int(11) DEFAULT NULL,
  `data_source` int(11) DEFAULT '1',
  `processed_for_is_external` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `s_c_p_u` (`site_id`,`page_id`,`url_no_www_sha1`) USING BTREE,
  KEY `base_dir_id` (`base_dir_id`,`site_id`) USING BTREE,
  KEY `base_domain_id` (`base_domain_id`,`site_id`) USING BTREE,
  KEY `index_links_on_domain_id_and_site_id` (`domain_id`,`site_id`) USING BTREE,
  KEY `domain_id__url_no_www` (`domain_id`,`url_no_www`) USING BTREE,
  KEY `second_dir_id` (`second_dir_id`,`site_id`) USING BTREE,
  KEY `second_domain_id` (`second_domain_id`,`site_id`) USING BTREE,
  KEY `s_c_d_p` (`site_id`,`domain_id`,`page_id`) USING BTREE,
  KEY `index_links_on_site_id_and_crawl_id_and_page_id` (`site_id`,`page_id`) USING BTREE,
  KEY `site_id` (`site_id`,`long_url_id`,`id`) USING BTREE,
  KEY `site_id_url` (`site_id`,`url`) USING BTREE,
  KEY `site_id_url_no_www` (`site_id`,`url_no_www`) USING BTREE,
  KEY `third_domain_id` (`third_domain_id`,`site_id`) USING BTREE,
  KEY `url_no_www_base_domain_id` (`url_no_www`,`base_domain_id`) USING BTREE,
  KEY `url_no_www_second_domain_id` (`url_no_www`,`second_domain_id`) USING BTREE,
  KEY `url_no_www_base_id` (`url_no_www`,`site_id`) USING BTREE,
  KEY `url_no_www_third_domain_id` (`url_no_www`,`third_domain_id`) USING BTREE,
  KEY `data_source__site_id` (`data_source`,`site_id`),
  KEY `processed_for_is_external__site_id__data_source` (`processed_for_is_external`,`site_id`,`data_source`),
  KEY `site_id__page_id__url_no_www_sha1` (`site_id`,`page_id`,`url_no_www_sha1`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;"
ActiveRecord::Base.connection.execute(sql)
  end
end