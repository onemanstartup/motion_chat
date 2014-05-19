schema "0001 initial" do

  entity 'User' do
    string :name
    string :email

    has_many :topics
    has_many :messages
  end

  entity 'Topic' do
    integer32 :topic_id
    string :title
    string :state
    boolean :viewed_by_owner
    float :hours
    float :price

    datetime :created_at
    datetime :updated_at

    belongs_to :user
    has_many :messages
  end

  entity 'Message' do
    integer32 :message_id
    string :body

    datetime :created_at
    datetime :updated_at

    belongs_to :user
    belongs_to :topic
  end

  entity 'Article' do
    string :title
    string :body
    integer32 :article_id
  end
end
