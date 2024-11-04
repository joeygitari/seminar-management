// namespace SeminarManagement.SeminarManagement;

// using Microsoft.Foundation.Navigate;

// pageextension 50101 "Navigate Ext" extends Navigate
// {
//     var
//         PostedSeminarRegHeader: Record "Posted Seminar Reg. Header",
//         SeminarLedgEntry: Record "Seminar Ledger Entry";
    
//     local procedure FindRecords()
//     begin
//         //CSD1.00>
//         if PostedSeminarRegHeader.READPERMISSION then begin 
//             PostedSeminarRegHeader.RESET; 
//             PostedSeminarRegHeader.SETFILTER("No.",DocNoFilter); 
//             PostedSeminarRegHeader.SETFILTER("Posting Date",PostingDateFilter); 
//             InsertIntoDocEntry( 
//                 DATABASE::"Posted Seminar Reg. Header",0,PostedSeminarRegHeader.TABLECAPTION, 
//                 PostedSeminarRegHeader.COUNT); 
//         end; 
//         //CSD1.00<
//         if SeminarLedgEntry.READPERMISSION then begin 
//             SeminarLedgEntry.RESET; 
//             SeminarLedgEntry.SETCURRENTKEY("Document No.","Posting Date"); 
//             SeminarLedgEntry.SETFILTER("Document No.",DocNoFilter); 
//             SeminarLedgEntry.SETFILTER("Posting Date",PostingDateFilter); 
//             InsertIntoDocEntry(
//                 DATABASE::"Seminar Ledger Entry",0,SeminarLedgEntry.TABLECAPTION, 
//                 SeminarLedgEntry.COUNT);
//         end;
//     end;

//     local procedure ShowRecords()
//     begin
//         //CSD1.00> 
//         DATABASE::"Posted Seminar Reg. Header": PAGE.RUN(0,PostedSeminarRegHeader); 
//         DATABASE::"Seminar Ledger Entry": PAGE.RUN(0,SeminarLedgEntry); 
//         //CSD1.00< 
//     end;
// }
