namespace SeminarManagement.SeminarManagement;

enum 50104 "Posted Seminar Status"
{
    Extensible = true;
    
    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; Planning)
    {
        Caption = 'Planning';
    }
    value(2; Canceled)
    {
        Caption = 'Canceled';
    }
}
