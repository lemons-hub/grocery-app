Add-Type -AssemblyName System.Drawing
$SRC = "I:\Claude\grocery-app\screenshots"
$DST = "I:\Claude\grocery-app\images"
New-Item -ItemType Directory -Force -Path $DST | Out-Null

function Crop([string]$srcFile, [string]$name, [int]$x, [int]$y, [int]$w, [int]$h) {
    try {
        $img = [System.Drawing.Image]::FromFile($srcFile)
        $rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
        $bmp = New-Object System.Drawing.Bitmap($w, $h)
        $g = [System.Drawing.Graphics]::FromImage($bmp)
        $destRect = New-Object System.Drawing.Rectangle(0, 0, $w, $h)
        $g.DrawImage($img, $destRect, $rect, [System.Drawing.GraphicsUnit]::Pixel)
        $g.Dispose()
        $outPath = "$DST\$name.jpg"
        $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        $bmp.Dispose()
        $img.Dispose()
        Write-Host "  OK: $name.jpg"
    } catch {
        Write-Host "  ERR $name : $_"
    }
}

# 이마트 상품페이지 (1920x1080) - 4열 그리드
# 열 X 시작: 285, 505, 725, 945 / 이미지폭x높: 210x210
# 행1 Y=62, 행2 Y=425
[int[]]$L = 285, 505, 725, 945
[int]$IW = 210; [int]$IH = 210
[int]$Y1 = 62;  [int]$Y2 = 425

Write-Host "=== 021344 (채소/두부) ==="
$f = "$SRC\20260615_021344.jpg"
Crop $f "채소_첼타리바삿"   $L[0] $Y1 $IW $IH
Crop $f "채소_청경채"       $L[1] $Y1 $IW $IH
Crop $f "채소_당근"         $L[2] $Y1 $IW $IH
Crop $f "채소_팽이버섯"     $L[3] $Y1 $IW $IH
Crop $f "채소_양배추"       $L[0] $Y2 $IW $IH
Crop $f "두부콩_두부"       $L[1] $Y2 $IW $IH

Write-Host "=== 021304 (라면/과자/생활) ==="
$f = "$SRC\20260615_021304.jpg"
Crop $f "라면면_너구리"         $L[0] $Y1 $IW $IH
Crop $f "육류냉동_찰순대"       $L[1] $Y1 $IW $IH
Crop $f "생활용품_생리대"       $L[2] $Y1 $IW $IH
Crop $f "과자간식_초코비스킷"   $L[3] $Y1 $IW $IH
Crop $f "과자간식_파인애플"     $L[0] $Y2 $IW $IH
Crop $f "통조림소스_참치"       $L[1] $Y2 $IW $IH
Crop $f "생활용품_크리넥스"     $L[2] $Y2 $IW $IH
Crop $f "과자간식_계란과자"     $L[3] $Y2 $IW $IH

Write-Host "=== 021313 (과자/음료/냉동) ==="
$f = "$SRC\20260615_021313.jpg"
Crop $f "과자간식_원소라"       $L[0] $Y1 $IW $IH
Crop $f "음료_토마토"           $L[1] $Y1 $IW $IH
Crop $f "달걀유제품_달걀"       $L[2] $Y1 $IW $IH
Crop $f "통조림소스_단무지"     $L[3] $Y1 $IW $IH
Crop $f "과자간식_유부김밥"     $L[0] $Y2 $IW $IH
Crop $f "과자간식_고추김"       $L[1] $Y2 $IW $IH
Crop $f "음료_서리태"           $L[2] $Y2 $IW $IH
Crop $f "과자간식_참깨스틱"     $L[3] $Y2 $IW $IH

Write-Host "=== 021326 (생활/수프/냉동) ==="
$f = "$SRC\20260615_021326.jpg"
Crop $f "생활용품_화장솜"       $L[0] $Y1 $IW $IH
Crop $f "국수프_어니언수프"     $L[1] $Y1 $IW $IH
Crop $f "통조림소스_초당옥수수" $L[2] $Y1 $IW $IH
Crop $f "통조림소스_스위트콘"   $L[3] $Y1 $IW $IH
Crop $f "달걀유제품_요거트"     $L[0] $Y2 $IW $IH
Crop $f "육류냉동_망고"         $L[1] $Y2 $IW $IH
Crop $f "육류냉동_떡국떡"       $L[2] $Y2 $IW $IH
Crop $f "육류냉동_삼겹살"       $L[3] $Y2 $IW $IH

Write-Host "=== 021336 (생활/냉동/채소) ==="
$f = "$SRC\20260615_021336.jpg"
Crop $f "생활용품_주방세제"     $L[0] $Y1 $IW $IH
Crop $f "육류냉동_슬라이스"     $L[1] $Y1 $IW $IH
Crop $f "두부콩_콩비지찌개"     $L[2] $Y1 $IW $IH
Crop $f "국수프_부대찌개"       $L[3] $Y1 $IW $IH
Crop $f "통조림소스_살사소스"   $L[0] $Y2 $IW $IH
Crop $f "채소_새송이"           $L[1] $Y2 $IW $IH
Crop $f "육류냉동_사브사브"     $L[2] $Y2 $IW $IH
Crop $f "채소_알배기"           $L[3] $Y2 $IW $IH

# 주문내역 032303 (1193x387) - 새 상품
Write-Host "=== 032303 (새 상품) ==="
$f = "$SRC\20260615_032303.jpg"
[int[]]$NX = 5, 120, 240, 360, 480, 600, 718, 836, 956
[int]$TW = 108; [int]$TH = 100
Crop $f "채소_로메인"           $NX[1] 5  $TW $TH
Crop $f "신규_우유또띠아"       $NX[4] 5  $TW $TH
Crop $f "신규_마라탕소스"       $NX[6] 5  $TW $TH
Crop $f "달걀유제품_계란15"     $NX[0] 200 $TW $TH

# 주문내역 032234 (1074x609) - 새 상품
Write-Host "=== 032234 (새 상품) ==="
$f = "$SRC\20260615_032234.jpg"
[int[]]$MX = 5, 120, 240, 360, 480, 600, 718, 836, 956
[int]$MW = 108; [int]$MH = 100
Crop $f "신규_자몽에이드"       $MX[0] 5   $MW $MH
Crop $f "신규_비빔김밥"         $MX[1] 5   $MW $MH
Crop $f "신규_일리커피"         $MX[4] 5   $MW $MH
Crop $f "신규_카스텔라"         $MX[2] 205 $MW $MH
Crop $f "신규_무뼈닭발"         $MX[7] 205 $MW $MH

$count = (Get-ChildItem $DST -Filter *.jpg | Measure-Object).Count
Write-Host "Done! $count images saved to $DST"
