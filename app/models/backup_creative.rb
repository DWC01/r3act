class BackupCreative < ActiveRecord::Base
	belongs_to :flight
	belongs_to :campaign
	belongs_to :creative

	# def validate_backup_creative_extension
	# 	unless image_extensions.include? @meta_data['extension']
	#     errors.add(:base, 'Backup creative must be gif, jpg, or png') 
	#   end
	# end
	
	# def validate_backup_creative_size
	# 	img = set_img_file
	# 	puts "#{img.columns}x#{img.rows}"
	# 	errors.add(:base, 'Backup creative is ' + "#{img.columns}x#{img.rows}") 
	# end
end
