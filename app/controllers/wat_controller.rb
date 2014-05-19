class WatController < UITableViewController

  def init
    super.tap do |c|
      c.title = "Wat"
    end
  end

  def messages
    [{arguments: {message: 'hello'}}, {arguments: {message: 'hello'}}]
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
    cell.layoutIfNeeded
    height = cell.layout.label.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
  end

end
