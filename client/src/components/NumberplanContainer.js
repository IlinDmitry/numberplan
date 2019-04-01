import React, { Component } from 'react';
import axios from 'axios';

class NumberpanContainer extends Component {
    constructor(props){
        super(props)
        this.state = {
            numberplans:[]
        }
    }

    componentDidMount() {
        axios.get('api/v1/german_numberplans')
            .then(response => {
            console.log(response)
            this.setState({
                numberplans: response.data
            })
        })
            .catch(error => console.log(error))
    }

    render() {
        return (
            <div className="Numberplan-container">
                {this.state.numberplans.map( record => {
                    return (
                        <div className="single-record" key={record.id}>
                             {record.prefix} {record.comment}
                        </div>
                    )
                    }

                )}
            </div>
        )
    }
}

export default NumberpanContainer;