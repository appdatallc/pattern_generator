class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    # create_table :unique_url2017_m1s do |t|
    #
    #   t.timestamps null: false
    # end
    sql = "CREATE TABLE `<%= migration_table_name %>` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_created_at` date DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `url_type_id` int(11) DEFAULT NULL,
  `url_sha1` varchar(255) DEFAULT NULL,
  `url` mediumtext,
  `url_no_www` mediumtext,
  PRIMARY KEY (`id`),
  KEY `url_sha1__id` (`site_id`,`url_sha1`,`url_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;"
    ActiveRecord::Base.connection.execute(sql)
    
  end
end
