table 50101 "Participants Table"
{
    Caption = 'Participants Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Participant No"; Integer)
        {
            Caption = 'Participant No';
        }
        field(2; "First Name"; Text[250])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[250])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[250])
        {
            Caption = 'Last Name';
        }
        field(5; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(6; "Phone Number"; Text[15])
        {
            Caption = 'Phone Number';
        }
        field(7; "Email Address"; Text[30])
        {
            Caption = 'Email Address';
        }
    }
    keys
    {
        key(PK; "Participant No")
        {
            Clustered = true;
        }
    }
}
