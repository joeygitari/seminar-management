// namespace SeminarManagement.SeminarManagement;

// using Microsoft.Projects.Resources.Journal;
// using Microsoft.Projects.Resources.Ledger;

// codeunit 50103 "Res. Jnl.-Post Line Extension"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Res. Jnl.-Post Line", 'OnBeforeResLedgEntryInsert', '', false, false)]
//     local procedure OnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line")
//     begin
//         // CSD1.00>
//         ResLedgerEntry."Seminar No." := ResJournalLine."Seminar No.";
//         ResLedgerEntry."Seminar Registration No." := ResJournalLine."Seminar Registration No.";
//         // CSD1.00<
//     end;
// }
