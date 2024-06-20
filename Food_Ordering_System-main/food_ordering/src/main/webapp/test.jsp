<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.checkbox-container {
    display: flex;
    justify-content: space-between;
    width: 400px;
    margin: 0 auto;
}

.checkbox-button {
    display: none;
}

.label-container {
    position: relative;
}

.link-line {
    position: absolute;
    height: 2px;
    width: 0;
    background-color: blue;
    top: 50%;
    transform: translateY(-50%);
    transition: width 0.2s;
}
</style>
</head>
<body>
    <div class="checkbox-container">
        <div class="label-container">
            <label>
                <input type="checkbox" name="checkbox1" class="checkbox-button">
                Checkbox 1
                <div class="link-line" id="line1"></div>
            </label>
        </div>
        <div class="label-container">
            <label>
                <input type="checkbox" name="checkbox2" class="checkbox-button">
                Checkbox 2
                <div class="link-line" id="line2"></div>
            </label>
        </div>
    </div>

    <script type="text/javascript">
        const checkbox1 = document.querySelector('input[name="checkbox1"]');
        const checkbox2 = document.querySelector('input[name="checkbox2"]');
        const line1 = document.getElementById('line1');
        const line2 = document.getElementById('line2');

        checkbox1.addEventListener('change', () => {
            if (checkbox1.checked) {
                line1.style.width = '50%';
            } else {
                line1.style.width = '0';
            }
        });

        checkbox2.addEventListener('change', () => {
            if (checkbox2.checked) {
                line2.style.width = '50%';
            } else {
                line2.style.width = '0';
            }
        });
    </script>
</body>
</html>
