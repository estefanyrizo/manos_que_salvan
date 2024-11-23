function depending_selects(data, id_select_padre, id_select_hijo) {
    let select_padre = document.querySelector('#' + id_select_padre);
    let select_hijo = document.querySelector('#' + id_select_hijo);
    
    const first_option = '<option selected value="" disabled>Seleccione una opción</option>';
    
    let select_padre_html = first_option;
    let select_hijo_html = first_option;
    
    // Crear las opciones para el select padre
    for (let key in data) {
        let padre = data[key];
        select_padre_html += `<option value="${padre.id_padre}">${key}</option>`;
    }
    
    select_padre.innerHTML = select_padre_html;
    select_hijo.innerHTML = select_hijo_html;
    
    select_padre.addEventListener('change', function (e) {
        update_hijo_options(e.target.value);
    });

    function update_hijo_options(id_padre) {
        select_hijo_html = first_option;
        
        // Encontrar los hijos correspondientes al id_padre seleccionado
        for (let key in data) {
            let padre = data[key];
            if (padre.id_padre == id_padre) {
                // Iterar sobre los hijos
                for (let hijo of padre.hijos) {
                    select_hijo_html += `<option value="${hijo.id_hijo}">${hijo.nombre_hijo}</option>`;
                }
                break; // Salir del loop una vez encontrado el padre correspondiente
            }
        }
        
        select_hijo.innerHTML = select_hijo_html;
    }
}
