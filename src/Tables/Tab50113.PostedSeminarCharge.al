// table 50113 "Posted Seminar Charge"
// {
//     Caption = 'Posted Seminar Charge';
//     DataClassification = ToBeClassified;
    
//     fields
//     {
//         field(1; "Document No."; Code[20])
//         {
//             Caption = 'Document No.';
//             DataClassification = CustomerContent;
//             TableRelation="Posted Seminar Reg. Header";
//         }
//         field(2; "Line No."; Integer)
//         {
//             Caption = 'Line No.';
//             DataClassification = CustomerContent;
//         }
//         field(3; "Type"; Option)
//         {
//             Caption = 'Type';
//             DataClassification = CustomerContent;
//             OptionMembers = Resource,"G/L Account";
//         }
//         field(4; Registered; Boolean)
//         {
//             Caption = 'Registered';
//             DataClassification = CustomerContent;
//             Editable = false;
//         }
//         field(5; "Gen. Prod. Posting Group"; Code[20])
//         {
//             Caption = 'Gen. Prod. Posting Group';
//             DataClassification = CustomerContent;
//             TableRelation = "Gen. Product Posting Group";
//         }
//         field(6; "VAT Prod. Posting Group"; Code[20])
//         {
//             Caption = 'VAT Prod. Posting Group';
//             DataClassification = CustomerContent;
//             TableRelation = "VAT Product Posting Group";
//         }
//         field(7; "Unit of Measure Code"; Code[10])
//         {
//             Caption = 'Unit of Measure Code';
//             DataClassification = CustomerContent;
//         }
//         field(8; "Unit Price"; Decimal)
//         {
//             Caption = 'Unit Price';
//             DataClassification = CustomerContent;
//             AutoFormatType = 2;
//             MinValue = 0;
//         }
//         field(9; Quantity; Decimal)
//         {
//             Caption = 'Quantity';
//             DataClassification = CustomerContent;
//             DecimalPlaces = 0 : 5;
//         }
//         field(10; "Total Price"; Decimal)
//         {
//             Caption = 'Total Price';
//             DataClassification = CustomerContent;
//             Editable = false;
//             AutoFormatType = 1;
//         }
//         field(11; "Qty. per Unit of Measure"; Decimal)
//         {
//             Caption = 'Qty. per Unit of Measure';
//             DataClassification = CustomerContent;
//         }
//         field(12; "No."; Code[20])
//         {
//             Caption = 'No.';
//             DataClassification = CustomerContent;
//         }
//         field(13; Description; Text[100])
//         {
//             Caption = 'Description';
//             DataClassification = CustomerContent;
//         }
//         field(14; "To Invoice"; Boolean)
//         {
//             Caption = 'To Invoice';
//             DataClassification = CustomerContent;
//             InitValue = true;
//         }
//         field(15; "Bill-to Customer No."; Code[20])
//         {
//             Caption = 'Bill-to Customer No.';
//             DataClassification = CustomerContent;
//             TableRelation = Customer;
//         }
//     }
//     keys
//     {
//         key(Key1; "Document No.", "Line No.")
//         {
//             Clustered = true;
//         }
//     }
// }
