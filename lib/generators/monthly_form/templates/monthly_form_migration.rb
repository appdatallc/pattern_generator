# CreateForm2017M2s
class <%= migration_class_name %> < ActiveRecord::Migration

  def change
    sql = "
    
    CREATE TABLE `<%= migration_table_name %>` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `created_at` datetime DEFAULT NULL,
      `updated_at` datetime DEFAULT NULL,
      `date_created_at` date DEFAULT NULL,
      `site_id` int(11) DEFAULT NULL,
      `page_id` int(11) DEFAULT NULL,
      `domain_id` int(11) DEFAULT NULL,
      `long_url_id` int(11) DEFAULT NULL,
      `url` varchar(255) DEFAULT NULL,
      `url_no_www` varchar(255) DEFAULT NULL,
      `url_sha1` varchar(255) DEFAULT NULL,
      `data_source` varchar(255) DEFAULT NULL,
      PRIMARY KEY (`id`),
      KEY `index_forms_on_domain_id_and_crawl_id` (`domain_id`,`site_id`) USING BTREE,
      KEY `index_forms_on_page_id_and_crawl_id` (`page_id`,`site_id`) USING BTREE,
      KEY `index_forms_on_site_id_and_crawl_id` (`site_id`) USING BTREE,
      KEY `site_id_url_page_id` (`site_id`,`url`,`page_id`) USING BTREE,
      KEY `url_url_no_www__id` (`site_id`,`url_no_www`,`page_id`) USING BTREE
    ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
"
    ActiveRecord::Base.connection.execute(sql)
  end
end
