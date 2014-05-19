class AppDelegate < PM::Delegate
  status_bar true, animation: :none
  def on_load(app, options)
    $app = UIApplication.sharedApplication
    # open ChatScreen.new(nav_bar: true)
    open UINavigationController.alloc.initWithRootViewController(WatController.new)
  end
end
