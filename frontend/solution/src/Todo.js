import React, { Component } from 'react';

class Todo extends Component {

  constructor(props) {
    super(props);

    this.state = {
      edit: false,
      id: null,
      mockData: []
    }
  }

  onSubmitHandle(event) {
    event.preventDefault();

    this.setState({
      mockData: [...this.state.mockData, {
        id: Date.now(),
        title: event.target.item.value,
      }]
    });

    event.target.item.value = '';
  }

  onDeleteHandle() {
    let id = arguments[0];

    this.setState({
      mockData: this.state.mockData.filter(item => {
        if (item.id !== id) {
          return item;
        }
        return false;
      })
    });
  }

  onEditHandle(event) {
    this.setState({
      edit: true,
      id: arguments[0],
      title: arguments[1]
    });
  }

  onUpdateHandle(event) {
    event.preventDefault();

    this.setState({
      mockData: this.state.mockData.map(item => {
        if (item.id === this.state.id) {
          item['title'] = event.target.updatedItem.value;
          return item;
        }

        return item;
      })
    });

    this.setState({
      edit: false
    });
  }

  renderEditForm(item) {
    if (this.state.edit && this.state.id === item.id) {
      return <form onSubmit={this.onUpdateHandle.bind(this)} className="inline-form">
        <input className="mr-5" type="text" name="updatedItem" defaultValue={this.state.title} />
        <button className="mr-5">Update</button>
      </form>
    }else{
      return <span className="mr-5">
        {item.title} <button onClick={this.onEditHandle.bind(this, item.id, item.title)}>Edit</button>
      </span>
    }
  }

  render() {
    return (
      <div>
        <br/>
        <form onSubmit={this.onSubmitHandle.bind(this)}>
          <input type="text" name="item"/> <button>Add</button>
        </form>
        <ol>
          {this.state.mockData.map(item => (
            <li key={item.id} className="mb-10">
              {this.renderEditForm(item)}
              <button onClick={this.onDeleteHandle.bind(this, item.id)}>Delete</button>
            </li>
          ))}
        </ol>
      </div>
    );
  }
}

export default Todo;
