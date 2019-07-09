module MainpagesHelper

  def is_numeric? string
    true if Float(string) rescue false
  end
  
  def helper_get_email_wodomain(emailstr)
    if(!emailstr.index("@").nil?)
      return emailstr[0..emailstr.index("@")-1]
    else
      return emailstr
    end
  end

  def help_get_banner(envstring)
    
    bannerarr = envstring.split('/')
    bannerstring = ""
    bannertemp = ""
    if(bannerarr.count <= 1)
      bannerstring = "Home"
    else
      if(bannerarr.count == 2)
        bannerstring = "All "
        bannertemp = "s"
      else
        bannerstring = "show "
        if(bannerarr[bannerarr.count-1].is_a? Numeric)
          bannertemp = " id=" + bannerarr[bannerarr.count-1]
        else
          bannertemp = " "+bannerarr[bannerarr.count-1]
        end
      end
      if(envstring.include? "edit")
        bannerstring = "edit "
        bannertemp = " id=" + bannerarr[bannerarr.count-2]
      end
      if(envstring.include? "new")
        bannerstring = "create new "
        bannertemp = ""
      end
      if(envstring.include? "projectcontrol")
        bannerstring += "Project"
      else
        if(envstring.include? "issueboard")
          bannerstring += "Issue"
        else
          if(envstring.include? "releasecenter")
            bannerstring += "Release"
          else
            if(envstring.include? "account")
              bannerstring += "Account"
            else
              if(envstring.include? "userdefinesearch")
                bannerstring += "Search"
                bannertemp = ""
              else
                if(envstring.include? "sign_in")
                  bannerstring = "Please sign in"
                  bannertemp = ""
                else
                  if(envstring.include? "mainpages")
                    bannerstring += current_user.firstname#"default: " + bannerarr[2]
                    bannertemp = ""
                  else
                    bannerstring += bannerarr[1]
                    bannertemp = ""
                  end
                end
              end
            end
          end
        end
      end
    end
    return bannerstring + bannertemp
  end
  
  def help_get_banner2(envstring)
    bannerarr = envstring.split('/')
    bannerprefix = ""
    bannerpostfix = ""
    if bannerarr.size == 0
    	return "Cobra Center Home"
    end
    if(envstring.include? "main")
      bannerprefix = bannerarr[bannerarr.count-1]
      if(is_numeric?(bannerprefix))
        bannerprefix = "Cobra Center Home"
      end
    else
      if(envstring.include? "project")
        bannerprefix = "Project"
      else
        if(envstring.include? "issue")
          if(!envstring.include? "release")
            bannerprefix = "Issue"
          else
            bannerprefix = bannerarr[1]
          end
        else
          if(envstring.include? "release")
            bannerprefix = "Release"
          else
            if(envstring.include? "search")
              bannerprefix = "Search"
            else
              if(envstring.include? "log")
                bannerprefix = "Log"
              else
                bannerprefix = bannerarr[1]
              end
            end
          end
        end
      end
      if(envstring.include? "file")
        bannerprefix += "file"
      end
      if(bannerarr.count == 2)
        bannerprefix = "All " + bannerprefix[0, bannerprefix.length-1]+"s"
      else
        if(envstring.include? "new")
          bannerprefix = "New " + bannerprefix
        else
          if(envstring.include? "search")
            bannerprefix = Userdefinesearch.find(bannerarr[2]).savedtitle
          else
            bannerpostfix = " " + bannerarr[2]
          end
        end
      end
    end
    
    return bannerprefix + bannerpostfix
  end
  
  def helper_get_findmyissues
    Rails.cache.fetch(current_user.id.to_s+"myissueboards") do 
      Issueboard.where("assignedto_id = ? AND status_id <> ?", current_user.id, 7).count
    end
    #return @myissueboards
  end
  
  def helper_write_findmyissues(keyid)
    #@myissueboards = Issueboard.includes(:projectcontrol, :status, :assignedto, :reporter, :customerlist, :bugreason).where("assignedto_id = ? AND status_id <> ?", current_user.id, 7).order("created_at").reverse
    Rails.cache.write(keyid.to_s+"myissueboards", Issueboard.where("assignedto_id = ? AND status_id <> ?", keyid, 7).count)
  end
  
  def helper_get_findmysubmits
    Rails.cache.fetch(current_user.id.to_s+"mysubmitissueboards") do
      Issueboard.where("reporter_id = ? AND status_id <> ?", current_user.id, 7).count
    end
    #return @mysubmitissueboards
  end
  
  def helper_write_findmysubmits(keyid)
    Rails.cache.write(keyid.to_s+"mysubmitissueboards", Issueboard.where("reporter_id = ? AND status_id <> ?", keyid, 7).count)
  end
  
  def helper_get_findmyprojects
    Rails.cache.fetch(current_user.id.to_s+"myprojectcontrols") do 
      Projectcontrol.where("assignedto_id = ? AND status_id <> ?", current_user.id, 7).count
    end
  end

  def helper_write_findmyprojects(keyid)
    Rails.cache.write(keyid.to_s+"myprojectcontrols", Projectcontrol.where("assignedto_id = ? AND status_id <> ?", keyid, 7).count)
  end
  
  def helper_get_findrecentreleases
    if(!current_user.nil?)
      Rails.cache.fetch(current_user.id.to_s+"myreleasecenters") do
        Releasecenter.search_recent_approved(current_user.recentduration).count
      end
    else
      Releasecenter.search_recent_approved(60).count
    end
    #return @myreleasecenters
  end

  def helper_write_findrecentreleases(keyid, idduration)
    #if(idduration == 1)
      ##Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.where("status_id = ? AND created_at >= ?", 8, 30.days.ago).count)
      #Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.includes(:projectcontrol, :status, :assignedto, :reporter, :hwplatform, :customerlist).joins(:releasecomment).where("releasecenters.status_id = ? AND releasecomments.reporter_id = ? AND releasecomments.created_at >= ? AND lower(releasecomments.commentdescription) like ?", 8, 1, 30.days.ago, "%approve%").count)
      #else
      #if(idduration == 2)
        ##Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.where("status_id = ? AND created_at >= ?", 8, 90.days.ago).count)
        #Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.includes(:projectcontrol, :status, :assignedto, :reporter, :hwplatform, :customerlist).joins(:releasecomment).where("releasecenters.status_id = ? AND releasecomments.reporter_id = ? AND releasecomments.created_at >= ? AND lower(releasecomments.commentdescription) like ?", 8, 1, 90.days.ago, "%approve%").count)
        #else
        #if(idduration == 3)
          ##Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.where("status_id = ? AND created_at >= ?", 8, 180.days.ago).count)
          #Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.includes(:projectcontrol, :status, :assignedto, :reporter, :hwplatform, :customerlist).joins(:releasecomment).where("releasecenters.status_id = ? AND releasecomments.reporter_id = ? AND releasecomments.created_at >= ? AND lower(releasecomments.commentdescription) like ?", 8, 1, 180.days.ago, "%approve%").count)
          #else
          #if(idduration == 4)
            ##Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.where("status_id = ? AND created_at >= ?", 8, 1.year.ago).count)
            #Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.includes(:projectcontrol, :status, :assignedto, :reporter, :hwplatform, :customerlist).joins(:releasecomment).where("releasecenters.status_id = ? AND releasecomments.reporter_id = ? AND releasecomments.created_at >= ? AND lower(releasecomments.commentdescription) like ?", 8, 1, 1.year.ago, "%approve%").count)
            #else
            ##Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.where("status_id = ?", 8).order("id"))
            #Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.includes(:projectcontrol, :status, :assignedto, :reporter, :hwplatform, :customerlist).joins(:releasecomment).where("releasecenters.status_id = ? AND releasecomments.reporter_id = ? AND lower(releasecomments.commentdescription) like ?", 8, 1, "%approve%").count)
            #end
        #end
        #end
    #end
    Rails.cache.write(keyid.to_s+"myreleasecenters", Releasecenter.search_recent_approved(current_user.recentduration).count)
  end
  
  def helper_get_findwaitapproves
    Rails.cache.fetch(current_user.id.to_s+"waitreleasecenters") do
      Releasecenter.where("assignedto_id = ? AND status_id = ?", 1, 1).count
    end
  end
  
  def helper_write_findwaitapproves(keyid)
    Rails.cache.write(keyid.to_s+"waitreleasecenters", Releasecenter.where("assignedto_id = ? AND status_id = ?", 1, 1).count)
  end
  
  def helper_get_mysearches
    #@mysearches = Rails.cache.fetch(current_user.id.to_s+"mysearches") do
      #Userdefinesearch.where("user_id = ? AND showonsidebar = ?", current_user.id, true).order("savedtitle")
      #end
    Rails.cache.read(current_user.id.to_s+"mysearches")
  end
  
  def helper_get_mysearchesid
    if(!Rails.cache.exist?("mysearchesid"))
      helper_write_mysearches(current_user.id, false)
    end
    Rails.cache.read(current_user.id.to_s+"mysearchesid")
  end
  
  def helper_get_mysearchestitle
    if(!Rails.cache.exist?("mysearchestitle"))
      helper_write_mysearches(current_user.id, false)
    end
    Rails.cache.read(current_user.id.to_s+"mysearchestitle")
  end
  
  def helper_write_mysearches(keyid, countonly)
    @mysearchestitle = Userdefinesearch.where("user_id = ? AND showonsidebar = ?", current_user.id, true).order("savedtitle")
    mysearchesidarray = Array.new(@mysearchestitle.count)
    mysearchestitlearray = Array.new(@mysearchestitle.count)
    i = 0
    @mysearchestitle.each do |onesearch|
      if(!countonly)
        mysearchesidarray[i] = onesearch.id
        mysearchestitlearray[i] = onesearch.savedtitle
      end
      i+=1
    end
    if(!countonly)
      Rails.cache.write(keyid.to_s+"mysearchesid", mysearchesidarray)
      Rails.cache.write(keyid.to_s+"mysearchestitle", mysearchestitlearray)
    end
  end
  
  def helper_get_mysearchescount(searchid)
    #if(!Rails.cache.exist?(current_user.id.to_s+"mysearchcount"+searchid.to_s))
      #@mysearchcount = Rails.cache.fetch(current_user.id.to_s+"mysearchcount"+searchid.to_s) do
    if(!Rails.cache.exist?("mysearchcount"+searchid.to_s))      #searchid is unique value, we can use it as identifier
      @mysearchcount = Rails.cache.fetch("mysearchcount"+searchid.to_s) do
        @userdefinesearch = Userdefinesearch.includes(:user).find(searchid)
        if(@userdefinesearch.searchtaget == 1)
          @userdefinesearch.searchprojectmerge.count
        else
          if(@userdefinesearch.searchtaget == 2)
            @userdefinesearch.searchissuemerge.count
          else
            if(@userdefinesearch.searchtaget == 3)
              @userdefinesearch.searchreleasemerge.count
            else
              0
            end
          end
        end
      end
    else
      #Rails.cache.read(current_user.id.to_s+"mysearchcount"+searchid.to_s)
      Rails.cache.read("mysearchcount"+searchid.to_s)
    end
  end
  
  def helper_writeall_mysearchescount(searchtagetvalue)
    @myallsearches = Userdefinesearch.where("searchtaget = ? AND showonsidebar = ?", searchtagetvalue, true)
    @myallsearches.each do |mysearch|
      if(searchtagetvalue == 1)
        Rails.cache.write("mysearchcount"+mysearch.id.to_s, mysearch.searchprojectmerge.count)
      else
        if(searchtagetvalue == 2)
          Rails.cache.write("mysearchcount"+mysearch.id.to_s, mysearch.searchissuemerge.count)
        else
          if(searchtagetvalue == 3)
            Rails.cache.write("mysearchcount"+mysearch.id.to_s, mysearch.searchreleasemerge.count)
          else
            0
          end
        end
      end
    end
  end
  
  def helper_writone_mysearchescount(mysearch)
    @myonesearch = mysearch
    if(@myonesearch.searchtaget == 1)
      Rails.cache.write("mysearchcount"+@myonesearch.id.to_s, @myonesearch.searchprojectmerge.count)
    else
      if(@myonesearch.searchtaget == 2)
        Rails.cache.write("mysearchcount"+@myonesearch.id.to_s, @myonesearch.searchissuemerge.count)
      else
        if(@myonesearch.searchtaget == 3)
          Rails.cache.write("mysearchcount"+@myonesearch.id.to_s, @myonesearch.searchreleasemerge.count)
        else
          0
        end
      end
    end
  end


  def helper_get_findmyissues_wocache
    myissueboards = Issueboard.where("assignedto_id = ? AND status_id <> ?", current_user.id, 7).count
    return myissueboards
  end

  def helper_get_findmysubmits_wocache
    mysubmitissueboards = Issueboard.where("reporter_id = ? AND status_id <> ?", current_user.id, 7).count
    return mysubmitissueboards
  end

  def helper_get_findmyprojects_wocache
    myprojectcontrols = Projectcontrol.where("assignedto_id = ? AND status_id <> ?", current_user.id, 7).count
    return myprojectcontrols
  end

  def helper_get_findrecentreleases_wocache
    #@myreleasecenters = 
      if(current_user.recentduration == 1)
        myreleasecenters = Releasecenter.where("status_id = ? AND created_at >= ?", 8, 30.days.ago).count
      else
        if(current_user.recentduration == 2)
          myreleasecenters = Releasecenter.where("status_id = ? AND created_at >= ?", 8, 90.days.ago).count
        else
          if(current_user.recentduration == 3)
            myreleasecenters = Releasecenter.where("status_id = ? AND created_at >= ?", 8, 180.days.ago).count
          else
            if(current_user.recentduration == 4)
              myreleasecenters = Releasecenter.where("status_id = ? AND created_at >= ?", 8, 1.year.ago).count
            else
              myreleasecenters = Releasecenter.where("status_id = ?", 8).count
            end
          end
        end
      end
      #end
    return myreleasecenters
  end

  def helper_get_findwaitapproves_wocache
    waitreleasecenters = Releasecenter.where("assignedto_id = ? AND status_id = ?", 1, 1).count
    return waitreleasecenters
  end
  
  def replace_sp_character(mystring)
    retstring = mystring
    retstring = retstring.gsub('<', "&lt;")
    retstring = retstring.gsub('>', "&gt;")
    retstring = retstring.gsub(' ', "&nbsp;")
    return retstring
  end
  
  def converttoquarter(statisticone)
    monthofyear = statisticone.created_at.strftime("%m").to_i
    strquarterly = statisticone.created_at.strftime("%y")
    if(monthofyear <= 4)
      strquarterly += "Q1"
    else
      if(monthofyear <= 7)
        strquarterly += "Q2"
      else
        if(monthofyear <= 10)
          strquarterly += "Q3"
        else
          strquarterly += "Q4"
        end
      end
    end
  end
  
  def helper_get_quarterstring(mytime)
    monthofyear = mytime.strftime("%m").to_i
    strquarterly = mytime.strftime("%Y")
    if(monthofyear < 4)
      strquarterly += "Q1"
    else
      if(monthofyear < 7)
        strquarterly += "Q2"
      else
        if(monthofyear < 10)
          strquarterly += "Q3"
        else
          strquarterly += "Q4"
        end
      end
    end
    return strquarterly
  end
  
  def helper_get_quartervalue(mytime)
    monthofyear = mytime.strftime("%m").to_i
    intquarterly = mytime.strftime("%Y").to_i
    intquarterly *= 100
    if(monthofyear < 4)
      intquarterly += 01
    else
      if(monthofyear < 7)
        intquarterly += 02
      else
        if(monthofyear < 10)
          intquarterly += 03
        else
          intquarterly += 04
        end
      end
    end
    return intquarterly
  end
  
  def helper_convert_datecocde(value)
    radian = value % 100
    samvalue = value / 100
    strdatecode = samvalue.to_s + "Q" + radian.to_s
    if(radian == 1)
      strdatecode += " Jan. ~ Mar."
    else
      if(radian == 2)
        strdatecode += " Apr. ~ Jun."
      else
        if(radian == 3)
          strdatecode += " Jul. ~ Sep."
        else
          strdatecode += " Oct. ~ Dec."
        end
      end
    end
    return strdatecode
  end
  
  def helper_get_quartermonth(mytime)
    monthofyear = mytime.strftime("%m").to_i
    strquarterly = mytime.strftime("%Y")
    if(monthofyear < 4)
      strquarterly = "Jan. ~ Mar."
    else
      if(monthofyear < 7)
        strquarterly = "Apr. ~ Jun."
      else
        if(monthofyear < 10)
          strquarterly = "Jul. ~ Sep."
        else
          strquarterly = "Oct. ~ Dec."
        end
      end
    end
    return strquarterly
  end
  
  def helper_get_quarterstartdate(mytime)
    monthvalue = mytime.strftime("%m").to_i
    strquarter = mytime.strftime("%Y")
    if(monthvalue < 4)
      strquarter += "-01-01 08:00:00"
    else
      if(monthvalue < 7)
        strquarter += "-04-01 08:00:00"
      else
        if(monthvalue < 10)
          strquarter += "-07-01 08:00:00"
        else
          strquarter += "-10-01 08:00:00"
        end
      end
    end
    return Time.zone.parse(strquarter).utc
  end
  
  def helper_get_quarterenddate(mytime)
    monthvalue = mytime.strftime("%m").to_i
    strquarter = mytime.strftime("%Y")
    if(monthvalue < 4)
      strquarter += "-04-01 08:00:0"
    else
      if(monthvalue < 7)
        strquarter += "-07-01 08:00:00"
      else
        if(monthvalue < 10)
          strquarter += "-10-01 08:00:00"
        else
          strquarter = (strquarter.to_i+1).to_s + "-01-01 08:00:00"
        end
      end
    end
    return Time.zone.parse(strquarter).utc
  end
  
  def helper_convert_datecode_to_Time(value)
    radian = value % 100
    samvalue = value / 100
    strdatecode = samvalue.to_s + "-"
    if(radian == 1)
      strdatecode += "01-01 "
    else
      if(radian == 2)
        strdatecode += "04-01 "
      else
        if(radian == 3)
          strdatecode += "07-01 "
        else
          strdatecode += "10-01 "
        end
      end
    end
    strdatecode += "08:00:00"
    return strdatecode
  end
  
  def helper_get_counter_bydatecode(predatecode, nowdatecode)
    samvalue_pre = predatecode / 100
    samvalue_now = nowdatecode / 100
    radian_pre = predatecode % 100
    radian_now = nowdatecode % 100
    samvalue_now -= samvalue_pre
    radian_now -= radian_pre
    counttime = samvalue_now * 4 + radian_now
    return counttime
  end
  
  def helper_write_myquarterlystatistic(myquarterstats)
    Rails.cache.write(myquarterstats.user_id.to_s+"myquarterlystatistic", myquarterstats)
  end
    
  def helper_read_myquarterlystatistic(myid)
    @statisticone = Rails.cache.read(myid.to_s+"myquarterlystatistic")
    return @statisticone
  end
  
  def helper_write_teamhistorystatistic(teamhistory)
    Rails.cache.write("teamhistorystatistic", teamhistory)
  end
  
  def helper_read_teamhistorystatistic
    @statistichistories = Rails.cache.read("teamhistorystatistic")
    return @statistichistories
  end
  
  def helper_get_logtypestring(logtypeval)
    tempstring = ""
    if(logtypeval == 1)
      tempstring = "Voltage"
    else
      if(logtypeval == 2)
        tempstring = "Current"
      else
        if(logtypeval == 3)
          tempstring = "Temperature"
        else
          tempstring = "misc"
        end
      end
    end
  end
  
  def helper_write_mylogbackground(myid, mylogbg)
    Rails.cache.write(myid.to_s+"mylogbackground"+mylogbg.id.to_s, mylogbg)
  end
  
  def helper_read_mylogbackground(myid, mylogbgid)
    @logcolumnitems = Rails.cache.read(myid.to_s+"mylogbackground"+mylogbgid.to_s)
    return @logcolumnitems
  end
  
  def helper_write_mylogcolumntype(myid, mylogbgid, mylogcoltype)
    Rails.cache.write(myid.to_s+"mylogcolumntype"+mylogbgid.to_s, mylogcoltype)
  end
  
  def helper_read_mylogcolumntype(myid, mylogbgid)
    @logcolumntypes = Rails.cache.read(myid.to_s+"mylogcolumntype"+mylogbgid.to_s)
    return @logcolumntypes
  end
  
  def helper_write_alluser()
    Rails.cache.write("allusers", User.order("email").all)
  end
  
  def helper_read_alluser()
    if(!Rails.cache.exist?("allusers"))
      helper_write_alluser()
    end
    return Rails.cache.read("allusers")
  end
  
  def helper_write_allcustomerlist()
    Rails.cache.write("allcustomerlists", Customerlist.order("customerorder").all)
  end
  
  def helper_read_allcustomerlist()
    if(!Rails.cache.exist?("allcustomerlists"))
      helper_write_allcustomerlist()
    end
    return Rails.cache.read("allcustomerlists")
  end
  
  def helper_write_allcategory()
    Rails.cache.write("allcategories", Categoryproject.order("categoryprojectorder").all)
  end
  
  def helper_read_allcategory()
    if(!Rails.cache.exist?("allcategories"))
      helper_write_allcategory()
    end
    return Rails.cache.read("allcategories")
  end
  
  def helper_write_allosplatform
    Rails.cache.write("allosplatforms", Osplatform.order("osorder").all)
  end
  
  def helper_read_allosplatform
    if(!Rails.cache.exist?("allosplatforms"))
      helper_write_allosplatform()
    end
    return Rails.cache.read("allosplatforms")
  end
  
  def helper_write_allhwplatform
    Rails.cache.write("allhwplatforms", Hwplatform.order("hwcode").all)
  end
  
  def helper_read_allhwplatform
    if(!Rails.cache.exist?("allhwplatforms"))
      helper_write_allhwplatform()
    end
    return Rails.cache.read("allhwplatforms")
  end
  
  def helper_write_allstatus
    Rails.cache.write("allstatuses", Status.order("statusorder").all)
  end
  
  def helper_read_allstatus
    if(!Rails.cache.exist?("allstatuses"))
      helper_write_allstatus()
    end
    return Rails.cache.read("allstatuses")
  end
  
  def helper_write_allresolution
    Rails.cache.write("allresolutions", Statussolution.order("solutionorder").all)
  end
  
  def helper_read_allresolution
    if(!Rails.cache.exist?("allresolutions"))
      helper_write_allresolution()
    end
    return Rails.cache.read("allresolutions")
  end
  
end
