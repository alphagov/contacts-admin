require 'spec_helper'
require 'fileutils'

describe ImportContacts, with_fakefs: true do
  let(:file_name) { 'contacts.csv' }

  describe 'initialisation' do
    context 'provided path does not exist' do
      it 'raises ArgumentError' do
        expect{
          ImportContacts.new('non-existent-path')
        }.to raise_error ArgumentError
      end
    end

    context 'provided path exists' do
      before {
        # prepare blank file
        FileUtils.touch(file_name)
      }

      it 'does not raise ArgumentError' do
        expect{
          ImportContacts.new(file_name)
        }.not_to raise_error
      end
    end
  end

  describe '#import' do
    before {
      # prepare file contents
      create_file file_name, %Q{
contactid,title,description,overrideurl,affinity,clustergroup,ogname,ogtexthead,ogtitle1,ogtag1,ogurl1,ogtitle2,ogtag2,ogurl2,ogmoreinfo,ogmoreinfourltitle,ogmoreinfourltag,ogmoreinfourl,telephonename,phonetexthead,phoneopenhours,telephone,telephonename2,phonetexthead2,phoneopenhours2,telephone2,textphone,international,fax,phonemoreinfo,phonemoreinfourltitle,phonemoreinfourltag,phonemoreinfourl,emailtexthead,emailtitle1,emailtag1,emailaddress1,emailurl1,emailtitle2,emailtag2,emailaddress2,emailurl2,emailmoreinfo,emailmoreinfourltitle,emailmoreinfourltag,emailmoreinfourl,postname,posttexthead,posttag1,postaddress1,posttag2,postaddress2,posttag3,postaddress3,postmoreinfo,postmoreinfourltitle,postmoreinfourltag,postmoreinfourl,keywords,alt_meta_title,alt_meta_description,alt_meta_keywords,entrysource,externalid,lastupdated
1,"Accessibility & specialist services
Specialist services
Services for customers with special needs",We offer a number of services to assist customers with particular needs,http://www.hmrc.gov.uk/contactus/particular-needs.htm,,See also,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,enquiry,OiQNArO16c4,31/05/2013 14:58:23
2,"Bereavement Helpline
Death",What to do about Income Tax and Self Assessment after a death,,"individuals & employees > Bereavement
individuals & employees > All individuals",Tax,,,What to do about tax and benefits after a death,"How to handle tax or benefit affairs after a death, and who to notify about the death",http://www.hmrc.gov.uk/bereavement/index.htm,Claiming back Income Tax on behalf of someone who has died,Find out when a tax refund might be due and how to claim it,http://www.hmrc.gov.uk/incometax/claim-for-deceased.htm,,,,,Taxes Helpline,"Telephoning the deceased's HMRC office.

When you call HMRC and an automated message starts, select option 2 and then option 4 to speak to an advisor on the Bereavement Helpline.","8.00 am to 8.00 pm, Monday to Friday 
8.00 am to 4.00 pm Saturday",0300 200 3300,,,,,0300 200 3319,+44 135 535 9022,,"If the deceased was receiving tax credits, Child Benefit or other payments dealt with by HMRC, you'll also need to tell the relevant helpline of the death. 

You might also need to conact HMRC if: 
- the deceased was paying voluntary National Insurance contributions
- the deceased was self employed and paying National Insurance contributions by Direct Debit
- Inheritance Tax is due 
- the Estate needs to pay tax on untaxed income or Capital  Gains Tax 
- the deceased is registered for VAT  

Follow the 'Bereavement' link below to find details of other relevant helplines.",Bereavement,,http://search2.hmrc.gov.uk/kb5/hmrc/contactus/results.page?affinity=2039,,,,,,,,,,,,,,,"If you need to write to HMRC about Income Tax and bereavement, such as form R27 (reclaiming tax or paying tax when someone dies), Self Assessent Tax Return and any other correspondence relating to bereavement for Pay As You Earn and Self Assessment, write to the address below.",,"HM Revenue & Customs 
Pay As You Earn and Self Assessment  
PO Box 4000 
Cardiff 
CF14 8HR 

Please clearly mark your letter 'Bereavement' so that we can quickly direct it to a dedicated team. The team will be responsible for dealing with Pay As You Earn and Self Assessment bereaved customers.",,,,,,,,,,,,,enquiry,7JTJEvPnPuo,24/06/2013 09:33:46
      }
    }

    it 'returns CSV row records' do
      expect(
        ImportContacts.new(file_name).import.all? {
          |entry| entry.kind_of?(CSV::Row)
        }
      ).to be_true
    end
  end
end
