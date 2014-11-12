#!/bin/sh

sdate=${1}
cdate=`date +"%m_%d_%Y"`
#rdir=`pwd`

# Check the date start range is set
if [ -z "$sdate" ]; then
    echo "!!!!---- Start date not defined ----!!!!"
    echo "Please define a start date in mm/dd/yyyy format."
    read sdate
fi
echo "" > $ANDROID_BUILD_TOP/Changelog_$cdate.txt
if [ -d $OUT ]; then
echo "" > $OUT/system/etc/CHANGELOG.txt
fi
# Find the directories to log
find $ANDROID_BUILD_TOP -name .git | sed 's/\/.git//g' | sed 'N;$!P;$!D;$d' | while read line
do
    cd $line
    # Test to see if the repo needs to have a changelog written.
    log=$(git log --date=short --pretty="%n%cd Committer: %cn Author: %an%n---Change:%s" --since=$sdate --date-order)
    project=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')
    if [ -z "$log" ]; then
        echo "Nothing updated on $project, skipping"
    else
        # Prepend group project ownership to each project.
        origin=`grep "$project" $ANDROID_BUILD_TOP/.repo/manifest.xml | awk {'print $4'} | cut -f2 -d '"'`
        if [ "$origin" = "plain" ] || [ "$origin" = "github" ]; then
            proj_credit=Plain-Andy
        elif [ "$origin" = "aokp" ]; then
            proj_credit=AOKP
        elif [ "$origin" = "cm" ]; then
            proj_credit=CyanogenMod
        else
            proj_credit="$origin"
        fi
        # Write the changelog
        echo "*--- ROM Source: $proj_credit ---*" >> $ANDROID_BUILD_TOP/Changelog_$cdate.txt
        echo "-$project-" >> $ANDROID_BUILD_TOP/Changelog_$cdate.txt
	if [ -d $OUT ]; then
        echo "*--- ROM Source: $proj_credit ---*" >> $OUT/system/etc/CHANGELOG.txt
        echo "-$project-" >> $OUT/system/etc/CHANGELOG.txt
	fi
        echo "$log" | while read line
        do
             echo "$line" >> $ANDROID_BUILD_TOP/Changelog_$cdate.txt
	if [ -d $OUT ]; then
             echo "$line" >> $OUT/system/etc/CHANGELOG.txt
	fi
        done
        echo "" >> $ANDROID_BUILD_TOP/Changelog_$cdate.txt
	if [ -d $OUT ]; then
        echo "" >> $OUT/system/etc/CHANGELOG.txt
	fi
    fi
done

return 0
