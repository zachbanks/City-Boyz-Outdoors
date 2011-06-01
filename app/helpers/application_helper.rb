module ApplicationHelper
  # Returns the title for a given page.
  def title
    base_title = "City Boyz Outdoors"
    unless @title
      base_title
    else
      "#{base_title} | #@title"
    end
  end
  
  # Returns the logo for the website.
  def logo
    image_tag("logo.png", :alt => "City Boyz Outdoors", :size => "300x150")
  end
  
  # Returns the Facebook logo.
  def facebook_logo
    image_tag("icons/facebook_logo.png", :alt => "Check us out on Facebook!", :size => "50x50")
  end
  
  # Returns the Twitter logo.
  def twitter_logo
    image_tag("icons/twitter_logo.png", :alt => "Follow us on Twitter!", :size => "50x50")
  end
  
  def disqus_thread
    %{
    <div id="disqus_thread">
      <script type="text/javascript">
    	    var disqus_shortname = 'cityboyzoutdoors';
          var disqus_developer = 1;
    		  //var disqus_identifier = 'cityboyzoutdoors21724';
    		  //var disqus_url = '#{request.url}'; // Rough, but works for now.

    		  /* * * DON'T EDIT BELOW THIS LINE * * */
    		  (function() {
    		      var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
    		      dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
    		      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    		  })();
    	</script>
    	<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </div>
    }
  end
  
  def format_date(date)
    date.strftime("%D")
  end
  
end
