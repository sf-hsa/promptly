=begin
	To run import_group manually, at the Promptly root, run each line below
	  rake "import_group[dc_waived_calfresh_english,dc_waived_calfresh_english, 1]"
	  rake "import_group[dc_waived_calfresh_spanish,dc_waived_calfresh_spanish, 1]"
	  rake "import_group[dc_waived_calfresh_chinese,dc_waived_calfresh_chinese, 1]"
	  rake "import_group[dc_waived_calfresh_vietnamese,dc_waived_calfresh_vietnamese, 1]"
	  rake "import_group[dc_waived_calfresh_russian,dc_waived_calfresh_russian, 1]"
	  rake "import_group[dc_waived_calfresh_tagalog,dc_waived_calfresh_tagalog, 1]"
	  rake "import_group[dc_waived_calfresh_other,dc_waived_calfresh_other, 1]"
	  rake "import_group[waived_cases,all_waived_cases, 1]"
	  rake "import_group[dc_waived_medical,dc_waived_medical, 21]"
	  rake "import_group[waived_cases,waived_cases, 21]"
	  rake "import_group[waived_medical,waived_medical, 21]"
	  rake "import_group[waived_medical_chinese,waived_medical_chinese, 21]"
	  rake "import_group[waived_medical_english,waived_medical_english, 21]"
	  rake "import_group[waived_medical_other,waived_medical_other, 21]"
	  rake "import_group[waived_medical_russian,waived_medical_russian, 21]"
	  rake "import_group[waived_medical_spanish,waived_medical_spanish, 21]"
	  rake "import_group[waived_medical_tagalog,waived_medical_tagalog, 21]"
	  rake "import_group[waived_medical_vietnamese,waived_medical_vietnamese, 21]"
	
	Inside the bracket[], 1st parameter is table name, 2nd parameter is group name, 3rd parameter is organization id.
	To check if any schedule job, at Promptly root, type "crontab -l".
	You can also run the schedule, copy from screen, you have something like below

0 10 * * * /bin/bash -l -c 'cd /home/likewise-open/HSA/promptly && RAILS_ENV=production bundle exec rake "import_group[dc_waived_calfresh_english,dc_waived_calfresh_english, 1]" --silent >> log/cron.log 2>&1'
0 10 * * * /bin/bash -l -c 'cd /home/likewise-open/HSA/promptly && RAILS_ENV=production bundle exec rake "import_group[dc_waived_calfresh_spanish,dc_waived_calfresh_spanish, 1]" --silent >> log/cron.log 2>&1'
...
	Just run below at Promptly root, to test it out
		/bin/bash -l -c 'cd /home/likewise-open/HSA/promptly && RAILS_ENV=production bundle exec rake "import_group[dc_waived_calfresh_english,dc_waived_calfresh_english, 1]"'
		
	To update the schedule after modify this file, type below at Promptly root
	whenever --update-crontab
=end

set :output, 'log/cron.log'

every 1.day, :at => '10:00 am' do
  rake "\"import_group[dc_waived_calfresh_english,dc_waived_calfresh_english, 1]\""
  rake "\"import_group[dc_waived_calfresh_spanish,dc_waived_calfresh_spanish, 1]\""
  rake "\"import_group[dc_waived_calfresh_chinese,dc_waived_calfresh_chinese, 1]\""
  rake "\"import_group[dc_waived_calfresh_vietnamese,dc_waived_calfresh_vietnamese, 1]\""
  rake "\"import_group[dc_waived_calfresh_russian,dc_waived_calfresh_russian, 1]\""
  rake "\"import_group[dc_waived_calfresh_tagalog,dc_waived_calfresh_tagalog, 1]\""
  rake "\"import_group[dc_waived_calfresh_other,dc_waived_calfresh_other, 1]\""
  rake "\"import_group[waived_cases,all_waived_cases, 1]\""
  rake "\"import_group[dc_waived_medical,dc_waived_medical, 5]\""
  rake "\"import_group[waived_cases,waived_cases, 5]\""
  rake "\"import_group[waived_medical,waived_medical, 5]\""
  rake "\"import_group[waived_medical_chinese,waived_medical_chinese, 5]\""
  rake "\"import_group[waived_medical_english,waived_medical_english, 5]\""
  rake "\"import_group[waived_medical_other,waived_medical_other, 5]\""
  rake "\"import_group[waived_medical_russian,waived_medical_russian, 5]\""
  rake "\"import_group[waived_medical_spanish,waived_medical_spanish, 5]\""
  rake "\"import_group[waived_medical_tagalog,waived_medical_tagalog, 5]\""
  rake "\"import_group[waived_medical_vietnamese,waived_medical_vietnamese, 5]\""
  
  rake "\"import_group[dc_waived_caap_english,dc_waived_caap_english, 6]\""
  rake "\"import_group[dc_waived_caap_chinese,dc_waived_caap_chinese, 6]\""
  rake "\"import_group[dc_waived_caap_other,dc_waived_caap_other, 6]\""
  rake "\"import_group[dc_waived_caap_russian,dc_waived_caap_russian, 6]\""
  rake "\"import_group[dc_waived_caap_spanish,dc_waived_caap_spanish, 6]\""
  rake "\"import_group[dc_waived_caap_tagalog,dc_waived_caap_tagalog, 6]\""
  rake "\"import_group[dc_waived_caap_vietnamese,dc_waived_caap_vietnamese, 6]\""
  
end

every 2.minutes do
  rake "update_daily_conversations", :environment => 'production'
end

every :monday, :at => '8am' do
  runner "Conversation.csv_export_stop_start"
end