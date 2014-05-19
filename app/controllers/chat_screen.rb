class ChatScreen < PM::TableScreen
  title "Chat"
  def on_load
    set_nav_bar_button :right, title: "+", action: :add_message
  end

  def viewWillAppear(animated)
    update_table_data
    super
  end

  def table_data
    [{
      cells: message_cells
    }]
  end

  def message_cells
    cells = []
    messages = ['So now you will have your first contraints on your UILabel. This will tell to xCode “don’t modify the height… the height always will be 20px”, so now in the “Document Outline” you will see that your UILabel ','lol']
    messages.each do |message|
      cells << { cell_class: MessageCell, cell_identifier: 'MessageCell', arguments: { message: message } }
    end
    cells
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    data_cell = self.promotion_table_data.cell(index_path: index_path)
    table_cell = MessageCell.new
    table_cell.setup(data_cell, self)
    # table_cell.layoutIfNeeded
    # table_cell.layout.label.preferredMaxLayoutWidth = table_view.frame.size.width
    # puts table_cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
    # puts table_cell.layout.label.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
    height = table_cell.layout.label.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
    # table_cell.setNeedsUpdateConstraints
    # table_cell.updateConstraintsIfNeeded
    height
  end
end
