namespace SeminarManagement.SeminarManagement;

using Microsoft.Projects.Resources.Journal;

tableextension 50103 "Res. Journal Line Ext" extends "Res. Journal Line"
{
    fields
    {
        field(50100; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            DataClassification = ToBeClassified;
            TableRelation = Seminar;
        }
        field(50101; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            DataClassification = ToBeClassified;
            TableRelation = "Posted Seminar Reg. Header";
        }
    }
}
