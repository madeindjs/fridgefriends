namespace :universe do
    Photo.find_each do |photo|
        begin
        filename = File.basename(URI.parse(photo.fileurl))
        photo.file_new.attach(io: open(photo.file.url), filename: d.file )
        rescue => e
        ## log/handle your errors in order to retry later
        end
    end
end
