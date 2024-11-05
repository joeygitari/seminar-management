table 50108 "Seminar Journal Line"
{
    Caption = 'Seminar Journal Line';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(3; "Line No."; Code[10])
        {
            Caption = 'Line No.';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

            trigger OnValidate()
            begin
                Validate("Document Date","Posting Date");
            end;
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(6; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
        }
        field(7; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
        }
        field(8; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
        }
        field(9; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(10; "Instructor Resource No."; Code[20])
        {
            Caption = 'Quantity';
        }
        field(11; "Charge Type"; Enum "Seminar Journal Charge Type")
        {
            Caption = 'Charge Type';
            DataClassification = CustomerContent;
        }

        field(12; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
        }
        field(13; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
        }
        field(14; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
        }
        field(15; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
        }
        field(16; "Entry Type"; Enum "Seminar Journal Entry Type")
        {
            Caption = 'Entry Type';
            DataClassification = CustomerContent;
        }
        field(17; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(18; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(19; "Type"; Enum "Seminar Charge Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(20; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(21; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
        }
        field(22; "Participant Name"; Text[50])
        {
            Caption = 'Participant Name';
        }
        field(23; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(24; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
        }
        field(25; "Res. Ledger Entry No."; Integer)
        {
            Caption = 'Res. Ledger Entry No.';
        }
        field(26; "Source Type"; Enum "Seminar Journal Source Type")
        {
            Caption = 'Source Type';
            DataClassification = CustomerContent;
        }
        field(27; "Source No."; Code[20])
        {
            Caption = 'Source No.';
        }
        field(28; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
        }
    }
    keys
    {
        key(Keys; "Journal Template Name","Journal Batch Name","Line No.")
        {
            Clustered = false;
        }
    }
    procedure EmptyLine():Boolean
    begin
        exit(("Seminar No." = '') and (Quantity = 0));
    end;
}
