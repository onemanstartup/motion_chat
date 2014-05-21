class OtherCell < UITableViewCell
  attr_accessor :title, :view, :layout

  def initWithStyle(data_cell, reuseIdentifier:identifier)
    super
    self
  end

  def setup(data_cell, table_screen)
    @layout = MessageCellLayout.new(root: self.contentView)
    @layout.label.text = data_cell[:arguments][:message]
    self.setNeedsLayout
    self.layoutIfNeeded
    self
  end

  def layoutSubviews
    super
    self.updateConstraints
  end

  def updateConstraints
    @layout.add_constraints(self)
    super
  end
end
