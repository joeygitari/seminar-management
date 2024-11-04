// namespace SeminarManagement.SeminarManagement;

// page 50110 "Seminar Ledger Entries"
// {
//     ApplicationArea = All;
//     Caption = 'Seminar Ledger Entries';
//     PageType = List;
//     SourceTable = "Seminar Ledger Entry";
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
//                     Visible = false;
//                 }
//                 field("Entry Type"; Rec."Entry Type")
//                 {
//                     ToolTip = 'Specifies the value of the Entry Type field.', Comment = '%';
//                 }
//                 field("Seminar No."; Rec."Seminar No.")
//                 {
//                     ToolTip = 'Specifies the value of the Seminar No. field.', Comment = '%';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ToolTip = 'Specifies the value of the Description field.', Comment = '%';
//                 }
//                 field("Bill-to Customer No."; Rec."Bill-to Customer No.")
//                 {
//                     ToolTip = 'Specifies the value of the Bill-to Customer No. field.', Comment = '%';
//                 }
//                 field("Charge Type"; Rec."Charge Type")
//                 {
//                     ToolTip = 'Specifies the value of the Charge Type field.', Comment = '%';
//                 }
//                 field("Type"; Rec."Type")
//                 {
//                     ToolTip = 'Specifies the value of the Type field.', Comment = '%';
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
//                 }
//                 field("Unit Price"; Rec."Unit Price")
//                 {
//                     ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
//                 }
//                 field("Total Price"; Rec."Total Price")
//                 {
//                     ToolTip = 'Specifies the value of the Total Price field.', Comment = '%';
//                 }
//                 field(Chargeable; Rec.Chargeable)
//                 {
//                     ToolTip = 'Specifies the value of the Chargeable field.', Comment = '%';
//                 }
//                 field("Participant Contact No."; Rec."Participant Contact No.")
//                 {
//                     ToolTip = 'Specifies the value of the Participant Contact No. field.', Comment = '%';
//                 }
//                 field("Participant Name"; Rec."Participant Name")
//                 {
//                     ToolTip = 'Specifies the value of the Participant Name field.', Comment = '%';
//                 }
//                 field("Instructor Resource No."; Rec."Instructor Resource No.")
//                 {
//                     ToolTip = 'Specifies the value of the Instructor Resource No. field.', Comment = '%';
//                 }
//                 field("Room Resource No."; Rec."Room Resource No.")
//                 {
//                     ToolTip = 'Specifies the value of the Room Resource No. field.', Comment = '%';
//                 }
//                 field("Starting Date"; Rec."Starting Date")
//                 {
//                     ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
//                 }
//                 field("Seminar Registration No."; Rec."Seminar Registration No.")
//                 {
//                     ToolTip = 'Specifies the value of the Seminar Registration No. field.', Comment = '%';
//                 }
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
//                 }
//             }
//         }
//         area(FactBoxes)
//         {
//             systempart(Links; Links)
//             {
//                 ApplicationArea = "Record Links";
//             }
//             systempart(Notes; Notes)
//             {
//                 ApplicationArea = "Notes";
//             }
//         }
//     }
// }
