// namespace SeminarManagement.SeminarManagement;

// codeunit 50102 "Seminar Reg.-Show Ledger"
// {
//     TableNo = "Seminar Register";

//     var
//         SeminarLedgerEntry: Record "Seminar Ledger Entry";
    
//     trigger OnRun()
//     begin
//         SeminarLedgerEntry.SetRange("Entry No.",Rec."From Entry No.",Rec."To Entry No."); 
//         Page.Run(Page::"Seminar Ledger Entries", SeminarLedgerEntry);
//     end;
    
// }
