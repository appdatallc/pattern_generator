class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    # create_table :page_body2017_m1s do |t|
    #
    #   t.timestamps null: false
    # end
    sql = "CREATE TABLE `<%= migration_table_name %>` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_created_at` date DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `html_sha1` varchar(255) DEFAULT NULL,
  `html` mediumblob,
  `ascii` mediumblob,
  `ascii_sha1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_page_bodies_on_page_id_and_date_created_at` (`page_id`,`date_created_at`) USING BTREE,
  KEY `index_page_bodies_on_site_id_and_date_created_at` (`site_id`,`date_created_at`) USING BTREE,
  KEY `index_page_bodies_on_site_id_and_html_sha1` (`site_id`,`html_sha1`) USING BTREE,
  KEY `index_page_bodies_on_site_id_and_page_id_and_html_sha1` (`site_id`,`page_id`,`html_sha1`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;"
    ActiveRecord::Base.connection.execute(sql)
  end
end
