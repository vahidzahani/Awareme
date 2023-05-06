VERSION 5.00
Begin VB.Form Form2 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   5190
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6360
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   ScaleHeight     =   5190
   ScaleWidth      =   6360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2055
      Left            =   0
      MousePointer    =   2  'Cross
      ScaleHeight     =   2025
      ScaleWidth      =   3585
      TabIndex        =   0
      Top             =   0
      Width           =   3615
      Begin VB.Line Line2 
         BorderWidth     =   3
         X1              =   600
         X2              =   2880
         Y1              =   1440
         Y2              =   1440
      End
      Begin VB.Line Line1 
         BorderWidth     =   3
         X1              =   480
         X2              =   2880
         Y1              =   1080
         Y2              =   1080
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Form_KeyPress(KeyAscii As Integer)
Unload Me
End Sub

Private Sub Form_Load()
Picture1.Height = Screen.Height
Picture1.Width = Screen.Width
 Picture1.Picture = CaptureScreen()






End Sub

Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Line1.X1 = 0
Line1.X2 = Screen.Width
Line1.Y1 = Y
Line1.Y2 = Y

Line2.X1 = X
Line2.X2 = X
Line2.Y1 = 0
Line2.Y2 = Screen.Height

End Sub

Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
MyColor = Picture1.Point(X, Y)
MYX = X
MYY = Y
Unload Me
End If
End Sub
