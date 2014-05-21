class WatController < UITableViewController

  def init
    super.tap do |c|
      c.title = "Wat"
    end
  end

  def messages
    [{arguments: {message: 'Since we dont have Interface Builder to help us create constaints (and since the ASCII format leaves much to be desired), many RubyMotion developers never bother to start using AutoLayout'}}, {arguments: {message: 'hello'}}]
  end

  def viewDidLoad
    super
    self.view.registerClass(OtherCell, forCellReuseIdentifier: "MessageCell")
    self.view.separatorInset = UIEdgeInsetsZero
  end

  def tableView(table_view, numberOfRowsInSection: section)
    messages.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @cell_id = "MessageCell"

    cell = table_view.dequeueReusableCellWithIdentifier(@cell_id)

    cell.setup(messages[index_path.row], table_view)
    cell
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    cell = OtherCell.new
    cell.setup(messages[index_path.row], table_view)
    cell.setNeedsUpdateConstraints
    cell.updateConstraintsIfNeeded
    cell.setNeedsLayout
    cell.layoutIfNeeded
    puts cell.layout.label.inspect
    puts cell.contentView.size.inspect
    # height = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1 # height 24
    height = cell.contentView.size.height + 20
    height
  end

end
