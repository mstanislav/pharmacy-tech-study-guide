class AppDelegate < ProMotion::AppDelegateParent
  def on_load(app, options)
    open_screen ReferenceScreen.new(nav_bar: true)
  end
end
