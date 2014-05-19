class MessageCellLayout < MotionKit::UIViewLayout
  view :label

  def layout
    add UILabel, :label
  end

  def label_style
    backgroundColor UIColor.blackColor
    numberOfLines 0
    font UIFont.boldSystemFontOfSize(60)
    textColor UIColor.blackColor
    shadowColor UIColor.whiteColor
    textAlignment UITextAlignmentLeft
    layer do
      shadowRadius 20
      shadowOpacity 0.5
      masksToBounds false
    end

  end

  def add_constraints(cell)
    context(cell.contentView) do # without context keep telling that in deffered I need context
      constraints(:label) do
        top_left.equals([0, 0]) # this works
        # width('100%') # raising private frame method calling
       width.equals(:superview) # wrong number of arguments
       #  left.equals(:superview) # wrong number of arguments
       #  right.equals(:superview) # wrong number of arguments
      end
    end
  end


end
