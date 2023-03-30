const modal = document.getElementById('modal');
const modalTitle = document.getElementById('modal-title');
const modalForm = document.getElementById('modal-form');
const modalSubmitBtn = document.getElementById('modal-submit-btn');

function showModal(service) {
	modalTitle.innerText = `${service}`;
	modalForm.setAttribute('data-service', service);
	modal.classList.add('is-active');
}

function hideModal() {
	modal.classList.remove('is-active');
}

modalForm.addEventListener('submit', (event) => {
	event.preventDefault();
	const service = modalForm.getAttribute('data-service');
	const identifierInput = document.getElementById('identifier-input');
	const identifier = identifierInput.value;
	if (!identifier) {
		alert('Por favor, insira o identificador do serviço');
		return;
	}
	modalSubmitBtn.classList.add('is-loading');
	fetch(`/stop-service?service=${service}&identifier=${identifier}`)
		.then((response) => {
			if (response.ok) {
				alert(`${service} com identificador ${identifier} foi desligado com sucesso!`);
				hideModal();
			} else {
				alert(`Erro ao desligar ${service}: ${response.statusText}`);
			}
		})
		.catch((error) => {
			alert(`Erro ao desligar ${service}: ${error.message}`);
		})
		.finally(() => {
			modalSubmitBtn.classList.remove('is-loading');
		});
});

modal.addEventListener('click', (event) => {
	if (event.target === modal) {
		hideModal();
	}
});
