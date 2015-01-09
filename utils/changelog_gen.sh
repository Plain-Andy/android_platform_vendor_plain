mkdir -p $OUT/system/etc
sdate=$1
if [ -n "$changelog_date" ]; then
sdate=$changelog_date
fi
cdate=`date +"%m_%d_%Y"`
#rdir=`pwd`

# Check the date start range is set
if [ -z "$sdate" ]; then
    echo "!!!!---- Start date not defined ----!!!!"
    echo "Please define a start date in mm/dd/yyyy format."
    read sdate
fi
echo "" > $ANDROID_BUILD_TOP/Changelog_$cdate.htm
if [ -d $OUT ]; then
echo "" > $OUT/system/etc/CHANGELOG.txt
fi
# Find the directories to log
find $ANDROID_BUILD_TOP -name .git | sed 's/\/.git//g' | sed 'N;$!P;$!D;$d' | while read line
do
    cd $line
    # Test to see if the repo needs to have a changelog written.
    log=$(git log --date=short --pretty="%n%cd Committer: %cn Author: %an%n---Change %h:%s" --since=$sdate --date-order)
    project=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')
    if [ -z "$log" ]; then
        echo "Nothing updated on $project, skipping"
    else
        # Prepend group project ownership to each project.
        origin=`grep "$project" $ANDROID_BUILD_TOP/.repo/manifest.xml | awk {'print $4'} | cut -f2 -d '"'`
        if [ "$origin" = "aosp" ] || [ "$origin" = "github" ]; then
            proj_credit=AOSP
        elif [ "$origin" = "aicp" ]; then
            proj_credit=AICP
        elif [ "$origin" = "cm" ]; then
            proj_credit=CyanogenMod
        elif [ "$origin" = "liquid" ]; then
            proj_credit=LiquidSmooth
        elif [ "$origin" = "pa-legacy" ]; then
            proj_credit=Plain-Andy
        elif [ "$origin" = "plain" ]; then
            proj_credit=Plain-Andy
        else
            proj_credit="$origin"
        fi
        # Write the changelog
        echo "<b><p>*--- ROM Source: $proj_credit ---*</p></b>" >> $ANDROID_BUILD_TOP/Changelog_$cdate.htm
        echo "<b><p>-$project-</p></b>" >> $ANDROID_BUILD_TOP/Changelog_$cdate.htm
        echo "<b><p>*--- ROM Source: $proj_credit ---*</p>" >> $OUT/system/etc/CHANGELOG.txt
        echo "<p>-$project-</p></b>" >> $OUT/system/etc/CHANGELOG.txt
        echo "$log" | while read line
        do
             echo "<p>$line</p>" >> $ANDROID_BUILD_TOP/Changelog_$cdate.htm
             echo "<p>$line</p>" >> $OUT/system/etc/CHANGELOG.txt
        done
        echo "" >> $ANDROID_BUILD_TOP/Changelog_$cdate.htm
        echo "" >> $OUT/system/etc/CHANGELOG.txt
    fi
done
