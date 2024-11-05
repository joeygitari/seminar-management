namespace SeminarManagement.SeminarManagement;

enum 50100 "Seminar Journal Charge Type"
{
    Extensible = true;
    
    value(0; Instructor)
    {
        Caption = 'Instructor';
    }
    value(1; Participant)
    {
        Caption = 'Participant';
    }
    value(2; Room)
    {
        Caption = 'Room';
    }
    value(3; Charge)
    {
        Caption = 'Charge';
    }
}
