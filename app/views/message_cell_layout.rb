class MessageCellLayout < MotionKit::Layout
  view :label

  def layout
    root :my_root_view do
      constraints do
        height.equals(:label)
        width.equals(:superview)
        x 0
        y 0
      end

      add UILabel, :label do
        constraints do
          top_left.equals x: 15, y:10
          width.equals(:superview).minus(35)
        end
      end
    end
  end

  def label_style
    numberOfLines 0
    font UIFont.boldSystemFontOfSize(16)
    textColor UIColor.blackColor
    shadowColor UIColor.whiteColor
    textAlignment UITextAlignmentLeft
  end

  def add_constraints(cell)
     # context(cell) do
       # constraints(cell) do
         # height.equals(:my_root_view)
         # trouble
         # one of the constraints in the following list is one you don't want. Try this: (1) look at each constraint and try to figure out which you don't expect; (2) find the code that added the unwanted constraint or constraints and fix it.
         # width.equals(cell.superview)
         # x 0
         # y 0
       # end
     # end
  end


end

