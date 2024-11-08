// namespace SeminarManagement.SeminarManagement;

// page 50117 "Seminar Statistics"
// {
//     ApplicationArea = All;
//     Caption = 'Seminar Statistics';
//     PageType = Card;
//     LinksAllowed = false;
//     SourceTable = Seminar;
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 group(FixedLayout)
//                 {
//                     Caption = 'Fixed Layout';

//                     group("This Year")
//                     {
//                         Caption = 'This Year';
//                         field("Total Price"; Rec."Total Price")
//                         {
//                         }
//                         field("Total Price (Not Chargeable)"; Rec."Total Price (Not Chargeable)")
//                         {
//                         }
//                         field("Total Price (Chargeable)"; Rec."Total Price (Chargeable)")
//                         {
//                         }
//                     }

//                     group("Last Year")
//                     {
//                         Caption = 'Last Year';
//                     }

//                     group("To Date")
//                     {
//                         Caption = 'To Date';
//                     }
//                 }
//             }
//         }
//     }

//     var
//         DateFilterCalc: Codeunit 358;
//         SeminarDateFilter: array[4] of Text[30];
//         SeminarDateName: array[4] of Text[30];
//         CurrentDate: Date;
//         TotalPrice: array[4] of Decimal;
//         TotalPriceNotChargeable: array[4] of Decimal;
//         TotalPriceChargeable: array[4] of Decimal;
//         I: Integer;
    
//     trigger OnAfterGetRecord()
//     begin
//         Rec.SetRange("No.", Rec."No.");
//         if CurrentDate <> WorkDate() then begin
//             CurrentDate := WorkDate();
//             DateFilterCalc.CreateAccountingPeriodFilter(SeminarDateFilter[1], SeminarDateName[1], CurrentDate, 0);
//             DateFilterCalc.CreateFiscalYearFilter(SeminarDateFilter[2], SeminarDateName[2], CurrentDate, 0);
//             DateFilterCalc.CreateFiscalYearFilter(SeminarDateFilter[3], SeminarDateName[3], CurrentDate, -1);
//         end;
//         for i:= 1 to 4 do begin
//             Rec.SetFilter("Date Filter", SeminarDateFilter[i]);
//             Rec.CalcFields("Total Price", "Total Price (Not Chargeable)", "Total Price (Chargeable)");
//             TotalPrice[i] := Rec."Total Price";
//             TotalPriceNotChargeable[i] := Rec."Total Price (Not Chargeable)";
//             TotalPriceChargeable[i] := Rec."Total Price (Chargeable)";
//         end;
//         Rec.SetRange("Date Filter", 0D, CurrentDate);
//     end;

// }
