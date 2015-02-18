  def check_content(*args)
    args.each do |arg|
      assert page.has_content?(arg), "Content -- #{arg} not available."
    end
  end
  
  def check_links(*args)
    args.each do |arg|
      assert page.has_content?(arg), "Link -- #{arg} not available."
    end
  end