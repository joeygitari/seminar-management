// table 50109 "Seminar Ledger Entry"
// {
//     Caption = 'Seminar Ledger Entry';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//             Caption = 'Entry No.';
//         }
//         field(2; "Seminar No."; Code[20])
//         {
//             Caption = 'Seminar No.';
//         }
//         field(3; "Posting Date"; Date)
//         {
//             Caption = 'Posting Date';
//         }
//         field(4; "Document Date"; Date)
//         {
//             Caption = 'Document Date';
//         }
//         field(5; "Entry Type"; Option)
//         {
//             Caption = 'Entry Type';
//             OptionMembers = value1,value2;
//         }
//         field(6; "Document No."; Code[20])
//         {
//             Caption = 'Document No.';
//         }
//         field(7; Description; Text[50])
//         {
//             Caption = 'Description';
//         }
//         field(8; "Bill-to Customer No."; Code[20])
//         {
//             Caption = 'Bill-to Customer No.';
//         }
//         field(9; "Charge Type"; Option)
//         {
//             Caption = 'Charge Type';
//             OptionMembers = Instructor,Room,Participant;
//         }
//         field(10; "Type"; Option)
//         {
//             Caption = 'Type';
//             OptionMembers = value1,value2;
//         }
//         field(11; Quantity; Decimal)
//         {
//             Caption = 'Quantity';
//         }
//         field(12; "Unit Price"; Decimal)
//         {
//             Caption = 'Unit Price';
//         }
//         field(13; "Total Price"; Decimal)
//         {
//             Caption = 'Total Price';
//         }
//         field(14; "Participant Contact No."; Code[20])
//         {
//             Caption = 'Participant Contact No.';
//         }
//         field(15; "Participant Name"; Text[50])
//         {
//             Caption = 'Participant Name';
//         }
//         field(16; Chargeable; Boolean)
//         {
//             Caption = 'Chargeable';
//         }
//         field(17; "Room Resource No."; Code[20])
//         {
//             Caption = 'Room Resource No.';
//         }
//         field(18; "Instructor Resource No."; Code[20])
//         {
//             Caption = 'Instructor Resource No.';
//         }
//         field(19; "Starting Date"; Date)
//         {
//             Caption = 'Starting Date';
//         }
//         field(20; "Seminar Registration No."; Code[20])
//         {
//             Caption = 'Seminar Registration No.';
//         }
//         field(21; "Res. Ledger Entry No."; Integer)
//         {
//             Caption = 'Res. Ledger Entry No.';
//         }
//         field(22; "Source Type"; Option)
//         {
//             Caption = 'Source Type';
//             OptionMembers = value1,value2;
//         }
//         field(23; "Source No."; Code[20])
//         {
//             Caption = 'Source No.';
//         }
//         field(24; "Journal Batch Name"; Code[10])
//         {
//             Caption = 'Journal Batch Name';
//         }
//         field(25; "Source Code"; Code[10])
//         {
//             Caption = 'Source Code';
//         }
//         field(26; "Reason Code"; Code[10])
//         {
//             Caption = 'Reason Code';
//         }
//         field(27; "No. Series"; Code[10])
//         {
//             Caption = 'No. Series';
//         }
//         field(28; "User ID"; Code[20])
//         {
//             Caption = 'User ID';
//             TableRelation = "User"."User Name";
//             ValidateTableRelation = false;
//             TestTableRelation = false;

//             trigger OnValidate()
//             var
//                 UserMgt: Codeunit "User Management";
//             begin
//                 // UserMgt.LookupUserID("User ID");
//             end;
//         }
//     }
//     keys
//     {
//         key(PK; "Entry No.")
//         {
//             Clustered = true;
//         }
//         key(Keys; "Document No.", "Posting Date")
//         {
//             Clustered = false;
//         }
//     }
// }
