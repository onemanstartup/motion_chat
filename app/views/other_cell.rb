class OtherCell < UITableViewCell
  attr_accessor :title, :view, :layout

  def initWithStyle(data_cell, reuseIdentifier:identifier)
    super
    self
  end

  def setup(data_cell, table_screen)
    @layout = MessageCellLayout.new
    @layout.label.text = data_cell[:arguments][:message]
    self.contentView.addSubview @layout.view
    self.setNeedsLayout
    self.layoutIfNeeded
    self.textLabel.text = data_cell[:arguments][:message]
    self
  end

  def layoutSubviews
    super
    self.updateConstraints
  end

  def updateConstraints
    super
    @layout.add_constraints(self)
  end
end

