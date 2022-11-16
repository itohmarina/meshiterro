class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  def get_image #特定の処理を名前で呼び出すことができるようになる
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename:'default-image.jpg', content_type: 'image/jpeg')
      #画像が設定されない場合はno_image.jpgをデフォルト画像とする


    end
    image
  end

end
